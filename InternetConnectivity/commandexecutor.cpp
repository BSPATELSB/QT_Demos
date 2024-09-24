#include "commandexecutor.h"
#include <QObject>
#include <QDebug>
#include <QProcess>
#include <QRegularExpressionMatch>

QString m_device,m_type,m_hwaddr,m_mtu,m_state,m_connection,m_carrier,m_ip4Address,m_gateway,m_dns,m_ip6Address;

CommandExecutor::CommandExecutor(QObject *parent)
{

}

CommandExecutor::~CommandExecutor()
{

}

#if 0
QString CommandExecutor::executeIfconfig()
{
    QProcess process;

    QString program = "nmcli";
    QStringList arguments;
    //arguments << "connection" << "show" << "--active";
    arguments << "device" << "status";


    process.start(program, arguments);

    if (!process.waitForFinished()) {
        qDebug() << "Error: nmcli command failed";
        qDebug() << "Standard Error:" << process.readAllStandardError();
        return "Error: Command did not execute properly.";
    }

    QString output = process.readAllStandardOutput().trimmed();
    qDebug() << "nmcli output:" << output;

    // if (output.contains("wlp1s0")) {
    //     return getWiFiDetails(output);
    // }

    if (output.contains("enp0")) {
        return getEthernetDetails(output);
    }
    return "No Internet connected.";
}

QString CommandExecutor::getWiFiDetails(const QString &output)
{
    QStringList lines = output.split("\n");
    QString wifiInfo;
    for (const QString &line : lines) {
        if (line.contains("wlp1s0")) {
            wifiInfo += line + "\n";
        }
    }
    return wifiInfo.isEmpty() ? "Wi-Fi is not connected." : wifiInfo;
}

QString CommandExecutor::getEthernetDetails(const QString &output)
{
    QStringList lines = output.split("\n");
    QString ethernetInfo;
    for (const QString &line : lines) {
        if (line.contains("enp0")) {
            ethernetInfo += line + "\n";
        }
    }
    return ethernetInfo.isEmpty() ? "Ethernet is not connected." : ethernetInfo;
}
#endif

void CommandExecutor::fetchNetworkInfoFromScript() {
    // Create a QProcess to run the shell script
    QProcess process;
    process.start("/home/nxon/networkConnection.sh");

    // Wait for the process to finish
    if (!process.waitForFinished()) {
        qWarning() << "Failed to execute the shell script.";
        return;
    }

    // Capture the output from the script
    QString output = process.readAll();
    qDebug() << "Output from script:\n" << output;

    // Parse the output and store the values in variables
    QString device, type, hwaddr, mtu, state, connection, conPath, carrier, ip4Address, gateway, route1, route2, dns, ip6Address, ip6Gateway, ip6Route;

    QStringList lines = output.split("\n");
    foreach (const QString &line, lines) {
        if (line.contains("GENERAL.DEVICE")) {
            device = line.split(":").last().trimmed();
        } else if (line.contains("GENERAL.TYPE")) {
            type = line.split(":").last().trimmed();
        } else if (line.contains("GENERAL.HWADDR")) {
            hwaddr = line.split(":").last().trimmed();
        } else if (line.contains("GENERAL.MTU")) {
            mtu = line.split(":").last().trimmed();
        } else if (line.contains("GENERAL.STATE")) {
            state = line.split(":").last().trimmed();
        } else if (line.contains("GENERAL.CONNECTION")) {
            connection = line.split(":").last().trimmed();
        } else if (line.contains("GENERAL.CON-PATH")) {
            conPath = line.split(":").last().trimmed();
        } else if (line.contains("WIRED-PROPERTIES.CARRIER")) {
            carrier = line.split(":").last().trimmed();
        } else if (line.contains("IP4.ADDRESS[1]")) {
            ip4Address = line.split(":").last().trimmed();
        } else if (line.contains("IP4.GATEWAY")) {
            gateway = line.split(":").last().trimmed();
        } else if (line.contains("IP4.ROUTE[1]")) {
            route1 = line.split(":").last().trimmed();
        } else if (line.contains("IP4.ROUTE[2]")) {
            route2 = line.split(":").last().trimmed();
        } else if (line.contains("IP4.DNS[1]")) {
            dns = line.split(":").last().trimmed();
        } else if (line.contains("IP6.ADDRESS[1]")) {
            ip6Address = line.split(":").last().trimmed();
        } else if (line.contains("IP6.GATEWAY")) {
            ip6Gateway = line.split(":").last().trimmed();
        } else if (line.contains("IP6.ROUTE[1]")) {
            ip6Route = line.split(":").last().trimmed();
        }
    }

    // Output the parsed values
    qDebug() << "Device:" << device;
    qDebug() << "Type:" << type;
    qDebug() << "HW Address:" << hwaddr;
    qDebug() << "MTU:" << mtu;
    qDebug() << "State:" << state;
    qDebug() << "Connection:" << connection;
    qDebug() << "Connection Path:" << conPath;
    qDebug() << "Carrier:" << carrier;
    qDebug() << "IP4 Address:" << ip4Address;
    qDebug() << "Gateway:" << gateway;
    qDebug() << "IP4 Route 1:" << route1;
    qDebug() << "IP4 Route 2:" << route2;
    qDebug() << "DNS:" << dns;
    qDebug() << "IP6 Address:" << ip6Address;
    qDebug() << "IP6 Gateway:" << ip6Gateway;
    qDebug() << "IP6 Route:" << ip6Route;

    m_device = device;
    m_type = type;
    m_hwaddr = hwaddr;
    m_mtu = mtu;
    m_state = state;
    m_connection = connection;
    m_carrier = carrier;
    m_ip4Address = ip4Address;
    m_gateway = gateway;
    m_dns = dns;
}

QString CommandExecutor::device()
{
    return m_device;
}

QString CommandExecutor::type()
{
    return m_type;
}

QString CommandExecutor::hwaddr()
{
    return m_hwaddr;
}

QString CommandExecutor::mtu()
{
    return m_mtu;
}

QString CommandExecutor::state()
{
    return m_state;
}

QString CommandExecutor::connection()
{
    return m_connection;
}

QString CommandExecutor::carrier()
{
    return m_carrier;
}

QString CommandExecutor::ip4Address()
{
    return m_ip4Address;
}

QString CommandExecutor::gateway()
{
    return m_gateway;
}

QString CommandExecutor::dns()
{
    return m_dns;
}

QString CommandExecutor::ip6Address()
{
    return m_ip6Address;
}

