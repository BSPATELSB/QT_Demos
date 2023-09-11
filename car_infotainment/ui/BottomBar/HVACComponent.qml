import QtQuick 2.0

Item {
    property string fontColor: "#cfcfcf"
    property var hvacController: "70"

    Rectangle {
        id: decrementButton
        width: height / 2
        height: parent.height
        color: "black"
        anchors.left: parent.left
        Text {
            id: decrementText
            color: fontColor
            anchors.centerIn: parent
            text: "<"
            font.pixelSize: 12
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                hvacController.incrementTargetTemp(-1);
            }
        }
    }

    Text {
        id: targetTempText
        anchors {
            left: decrementButton.right
            //leftMargin: 25
            verticalCenter: parent.verticalCenter
        }
        color: fontColor
        font.pixelSize: 24
        text: "70"
    }

    Rectangle {
        id: incrementButton
        width: height / 2
        height: parent.height
        color: "black"
        anchors.left: targetTempText.right
        Text {
            id: incrementText
            color: fontColor
            anchors.centerIn: parent
            text: ">"
            font.pixelSize: 12
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                hvacController.incrementTargetTemp(1);
            }
        }
    }
}
