#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "brightnesscontrol.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    BrightnessControl brightness_Control;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("brightness_Control", &brightness_Control);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
