#ifndef BRIGHTNESSCONTROL_H
#define BRIGHTNESSCONTROL_H

#include <QObject>

class BrightnessControl : public QObject
{
    Q_OBJECT
public:
    explicit BrightnessControl(QObject *parent = nullptr);

public slots:
    void setBrightness(float value);

private:
    bool executeCommand(QString command);
};

#endif // BRIGHTNESSCONTROL_H
