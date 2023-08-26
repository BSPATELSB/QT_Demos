import QtQuick 2.15
import QtLocation 5.15
import QtPositioning 5.15

Rectangle {
    id: rightScreen

    anchors {
        top: parent.top
        bottom: bottombar.top
        right: parent.right
    }

    Plugin {
        id: mapPlugin
        name: "osm"
    }

    Map {
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(59.91, 10.75) // Oslo
        zoomLevel: 14
    }

    Image {
        id: lockIcon
        anchors {
            left: parent.left
            top: parent.top
            margins: 20
        }

        width: parent.width / 40
        fillMode: Image.PreserveAspectFit
        source: (systemHandler.carLocked ? "qrc:/ui/assets/lock.png" : "qrc:/ui/assets/unlock.png")

        MouseArea {
            anchors.fill: parent
            onClicked: {
                systemHandler.carLocked = !systemHandler.carLocked; // Toggle the carLocked property
            }
        }

        Text {
            id: dateTimeDisplay
            anchors{
                left: lockIcon.right
                leftMargin: 40
                bottom: lockIcon.bottom
            }

            font.pixelSize: 12
            font.bold: true
            color: "black"

            text: systemHandler.currentTime
        }

        Text {
            id: outdoorTempDisplay
            anchors{
                left: dateTimeDisplay.right
                leftMargin: 40
                bottom: lockIcon.bottom
            }

            font.pixelSize: 14
            font.bold: true
            color: "black"

            text: systemHandler.outdoorTemp + "°F"
        }

        Text {
            id: userNameDisplay
            anchors{
                left: outdoorTempDisplay.right
                leftMargin: 40
                bottom: lockIcon.bottom
            }

            font.pixelSize: 14
            font.bold: true
            color: "black"

            text: systemHandler.userName
        }
    }

    color: "orange"
    width: parent.width * 2/3
}
