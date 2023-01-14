#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QLocale>
#include <QTranslator>
#include <QQmlContext>
#include <QScreen>

#include "myobject.h"
#include "qobjectdefs.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString &locale : uiLanguages) {
        const QString baseName = "Starter5_" + QLocale(locale).name();
        if (translator.load(":/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);



//  方法一：全局对象，上下文对象，一般不用
    QQmlContext* context = engine.rootContext();
    QScreen *screen = QGuiApplication::primaryScreen();
    QRect rect = screen->virtualGeometry();
    context->setContextProperty("SCREEN_WIDTH",rect.width()/3);

//    MyObject obj;
//    context->setContextProperty("MyObject",&obj);

//    方法二，常用方法
    qmlRegisterType<MyObject>("MyObj",1,0,"MyObject");



    // c++->qml 绑定槽函数的方法二
    qmlRegisterSingletonInstance("MyObj",1,0,"MyObject1",MyObject::getInstance());

    engine.load(url);

//    // qml->c++ 绑定槽函数的方法三
//    // engine 加载完成后，load以后
//    auto list  = engine.rootObjects();
//    auto window = list.first();
//    QObject::connect(window, SIGNAL(qmlSig(int, QString)),
//                     MyObject::getInstance(), SLOT(cppSlot(int, QString);

//    QObject::connect(MyObject::getInstance(),SIGNAL(cppSig(QVariant, QVariant)),
//                     window,SLOT(qmlSlot(QVariant, QVariant)));


    /********** P24 从c++调用qml函数***********************/
    QVariant res; // qml函数返回值
    QVariant arg_1 = 123;   // 参数1
    QVariant arg_2 = "c++ call qml's Fun";
    auto window  = engine.rootObjects().first();
    QMetaObject::invokeMethod(window,"qmlFunc",
                              Q_RETURN_ARG(QVariant,res),
                              Q_ARG(QVariant,arg_1),
                              Q_ARG(QVariant,arg_2));
    qDebug() << "res = " << res;


    return app.exec();
}
