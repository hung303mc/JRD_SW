#include <QQmlContext>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "MyBluetooth.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    MyBluetooth myBluetooth;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("myBluetooth", &myBluetooth);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
