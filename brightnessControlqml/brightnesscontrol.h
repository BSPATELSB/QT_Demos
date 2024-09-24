#ifndef BRIGHTNESSCONTROL_H
#define BRIGHTNESSCONTROL_H

#include <QObject>
#include <QVariant>

class brightnessControl : public QObject
{
    Q_OBJECT
public:
   explicit brightnessControl(QObject *parent = nullptr);
    //~brightnessControl();

    Q_INVOKABLE void setBrightness(float value);

    bool executeCommand(QString command);
};

#endif // BRIGHTNESSCONTROL_H
