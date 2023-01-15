#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "mylistmodel.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

//    方法一：
//    engine.rootContext()->setContextProperty("MyListModel", MyListModel::getInstance());

//    方法二，常用
    qmlRegisterSingletonInstance("MyModel",1,0, "MyListModel",MyListModel::getInstance());

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
