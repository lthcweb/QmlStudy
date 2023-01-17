#include <QGuiApplication>
#include "core/ComponentCreatorEngine.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
        QCoreApplication::setAttribute(Qt::AA_UseSoftwareOpenGL);
#endif
    qputenv("MAIN_QML", "../M2_FileWatcher/qml/main.qml");

    QGuiApplication app(argc, argv);

    ComponentCreatorEngine engine;

    engine.rootContext()->setContextProperty("QmlEngine", &engine);

    const QUrl url(qgetenv("MAIN_QML"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
