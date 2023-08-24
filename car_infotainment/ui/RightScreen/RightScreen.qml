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
    color: "orange"
    width: parent.width * 2/3
}
