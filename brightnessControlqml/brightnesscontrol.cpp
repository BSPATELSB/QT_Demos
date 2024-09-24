#include "brightnesscontrol.h"
#include <QProcess>
#include <QDebug>

brightnessControl::brightnessControl(QObject *parent)
{

}

void brightnessControl::setBrightness(float value)
{
    QString command = "xrandr --output $(xrandr | grep ' connected' | awk '{ print$1 }') --brightness " + QString::number(value);
    qDebug() << "the value is: " << value;
    executeCommand(command);
}

bool brightnessControl::executeCommand(QString command)
{
    QProcess process;
    process.start("bash",QStringList() << "-c" << command);
    process.waitForFinished();
    return (process.exitCode() == 0);
}
