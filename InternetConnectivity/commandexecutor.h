#ifndef COMMANDEXECUTOR_H
#define COMMANDEXECUTOR_H

#include <QObject>
#include <QVariant>

class CommandExecutor : public QObject
{
    Q_OBJECT
public:
    explicit CommandExecutor(QObject *parent = nullptr);
    ~CommandExecutor();

   // Q_INVOKABLE QString executeIfconfig();

   // Q_INVOKABLE QString getWiFiDetails(const QString &output);

   // Q_INVOKABLE QString getEthernetDetails(const QString &output);

    Q_INVOKABLE void fetchNetworkInfoFromScript();

    Q_INVOKABLE QString device();
    Q_INVOKABLE QString type();
    Q_INVOKABLE QString hwaddr();
    Q_INVOKABLE QString mtu();
    Q_INVOKABLE QString state();
    Q_INVOKABLE QString connection();
    Q_INVOKABLE QString carrier();
    Q_INVOKABLE QString ip4Address();
    Q_INVOKABLE QString gateway();
    Q_INVOKABLE QString dns();
    Q_INVOKABLE QString ip6Address();
};

#endif // COMMANDEXECUTOR_H
