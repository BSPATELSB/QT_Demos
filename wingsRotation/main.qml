import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 720
    height: 380
    visible: true
    title: qsTr("Fan Controller")

    flags: "FramelessWindowHint"

    Image {
        id: root
        source: "qrc:/assets/metal.jpg"
        anchors.fill: parent

        // MouseArea {
        // anchors.fill: parent
        // onClicked:fanImage.rotation += 20000*2
        // }
    }

    Image {
        id: fanImage
        anchors.centerIn: parent
        source: "qrc:/assets/fan.png"
        height: 350
        width: 350

        Behavior on rotation {
            NumberAnimation {
            duration: 15000
            }
        }
    }

    Button {
        id:button1
        onClicked: fanImage.rotation += 5000
        anchors {
            top: parent.top
            topMargin: 50
            left: parent.left
            leftMargin: 30
        }
    }

    Button {
        id: button2
        onClicked: fanImage.rotation += 8000
        anchors {
            top: parent.top
            topMargin: 100
            left: parent.left
            leftMargin: 30
        }
    }

    Button {
        id: button3
        onClicked: fanImage.rotation += 10000
        anchors {
            top: parent.top
            topMargin: 150
            left: parent.left
            leftMargin: 30
        }
    }

    Button {
        id: button4
        onClicked: fanImage.rotation += 20000
        anchors {
            top: parent.top
            topMargin: 200
            left: parent.left
            leftMargin: 30
        }
    }

    Button {
        id: button5
        onClicked: fanImage.rotation += 30000
        anchors {
            top: parent.top
            topMargin: 250
            left: parent.left
            leftMargin: 30
        }
    }

    // Slider {
    //     id:speedController
    //     from: fanImage.rotation += 20000
    //     to: fanImage.rotation += 0
    //     anchors.centerIn: parent
    // }
}
