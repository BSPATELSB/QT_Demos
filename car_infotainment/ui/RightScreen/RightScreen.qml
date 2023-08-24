import QtQuick 2.15

Rectangle {
    id: rightScreen

    anchors {
        top: parent.top
        bottom: bottombar.top
        right: parent.right
    }
    color: "orange"
    width: parent.width * 2/3
}
