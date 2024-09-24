import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 1280
    height: 800
    title: "Network Status"

    Component.onCompleted: {
        commandExecutor.fetchNetworkInfoFromScript();
        updateNetworkFields();
    }

    ListModel {
        id: networkFieldsModel
        ListElement { title: "Device"; value: "" }
        ListElement { title: "Type"; value: "" }
        ListElement { title: "HW Address"; value: "" }
        ListElement { title: "MTU"; value: "" }
        ListElement { title: "State"; value: "" }
        ListElement { title: "Connection"; value: "" }
        ListElement { title: "Carrier"; value: "" }
        ListElement { title: "IPv4 Address"; value: "" }
        ListElement { title: "Gateway"; value: "" }
        ListElement { title: "DNS"; value: "" }
        ListElement { title: "IPv6 Address"; value: "" }
    }

    Image {
        id: backgroundImage
        source: "qrc:/assets/Welcome-screen.png"
        anchors.fill: parent
        opacity: 30
    }

    Column {
        anchors {
            top: parent.top
            topMargin: 80
            left: parent.left
            leftMargin: 60
        }
        spacing: 30

        Text {
            text: "Network Information"
            font.family: "Arial"
            font.pointSize: 40
            color: "white"
            anchors.left: parent.left
        }

        ScrollView {
            width: 500
            height: 600
            clip: true

            Column {
                spacing: 10
                width: parent.width

                Repeater {
                    model: networkFieldsModel
                    delegate: Row {
                        spacing: 10
                        width: parent.width

                        Text {
                            text: model.title + ":"
                            font.pointSize: 20
                            font.family: "Arial"
                            color: "white"
                            width: 200
                        }

                        Rectangle {
                            width: 200
                            height: 30
                            radius: 10
                            color: "Transparent"
                            //border.color: "white"

                            Text {
                                text: model.value // Show the value directly from the model
                                font.pointSize: 20
                                color: "white"
                                anchors.centerIn: parent  // Center text in the rectangle
                            }
                        }
                    }
                }
            }
        }

        Button {
            text: "Check Network Status"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                console.log("Fetching network information...");
                commandExecutor.fetchNetworkInfoFromScript();
                updateNetworkFields();
            }
        }
    }

    function updateNetworkFields() {
        console.log("Updating network fields...");
        networkFieldsModel.set(0, { title: "Device", value: commandExecutor.device() });
        networkFieldsModel.set(1, { title: "Type", value: commandExecutor.type() });
        networkFieldsModel.set(2, { title: "HW Address", value: commandExecutor.hwaddr() });
        networkFieldsModel.set(3, { title: "MTU", value: commandExecutor.mtu() });
        networkFieldsModel.set(4, { title: "State", value: commandExecutor.state() });
        networkFieldsModel.set(5, { title: "Connection", value: commandExecutor.connection() });
        networkFieldsModel.set(6, { title: "Carrier", value: commandExecutor.carrier() });
        networkFieldsModel.set(7, { title: "IPv4 Address", value: commandExecutor.ip4Address() });
        networkFieldsModel.set(8, { title: "Gateway", value: commandExecutor.gateway() });
        networkFieldsModel.set(9, { title: "DNS", value: commandExecutor.dns() });
        networkFieldsModel.set(10, { title: "IPv6 Address", value: commandExecutor.ip6Address() });

        // Log all updated values
        for (var i = 0; i < networkFieldsModel.count; i++) {
            console.log(networkFieldsModel.get(i).title + ": " + networkFieldsModel.get(i).value);
        }
    }
}
