#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>
#include <QTimer>

class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carLocked READ carLocked WRITE setCarLocked NOTIFY carLockedChanged)
    Q_PROPERTY(int outdoorTemp READ outdoorTemp WRITE setOutdoorTemp NOTIFY outdoorTempChanged)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged)
public:
    explicit System(QObject *parent = nullptr);

    bool carLocked() const;
    void setCarLocked(bool carLocked);

    int outdoorTemp() const;
    void setOutdoorTemp(int outdoorTemp);

    QString userName() const;
    void setUserName(const QString userName);

    QString currentTime() const;
    void setCurrentTime(const QString currentTime);

    void m_currentTimeTimerTimeout();

signals:

    void carLockedChanged(bool carLocked);
    void outdoorTempChanged();

    void userNameChanged();

    void currentTimeChanged();

private:
    bool m_carLocked;
    int m_outdoorTemp;
    QString m_userName;
    QString m_currentTime;
    QTimer *m_currentTimeTimer;
};

#endif // SYSTEM_H
