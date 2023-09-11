import QtQuick 2.0
import QtLocation 5.3
import QtPositioning 5.3
import QtWebEngine 1.0

Rectangle {
    id: rightScreen

    anchors {
        top: parent.top
        bottom: bottombar.top
        right: parent.right
    }

    Plugin {
        id: mapPlugin
        name: "mapboxgl"
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

        NavigationsearchBox{
            id:searchBox

            width: parent.width * 13
            height: parent.height * 3

            anchors{
                left: lockIcon.left
                top: lockIcon.bottom
                topMargin: 20
            }
        }
    }

    color: "orange"
    width: parent.width * 2/3

    WebEngineView {
        anchors.fill: parent
        url: "https://www.youtube.com/"
        visible: false
    }

    WebEngineView {
        anchors.fill: parent
        url: "https://www.radioindia.in/"
        visible: false
    }


}
