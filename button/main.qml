import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 948
    height: 590
    color: "black"

    Rectangle {
        color: "#000000"  // Set background color to black

        Rectangle {
            width: 220
            height: 60
            x: 71
            y: 498

            radius: 30
            color: "#4B3EF4"

            MouseArea {
                id: mouseArea
                anchors.fill: parent

                cursorShape: Qt.PointingHandCursor  // Set cursor to hand on hover

                onClicked: {
                    ripple.start()
                    console.log("Button clicked!")
                    // Add your click functionality here
                }

                onEntered: {
                    parent.color = "#7D5FA7"
                }

                onExited: {
                    parent.color = "#4B3EF4"
                }

                Text {
                    text: "Bhaumik"
                    font.family: "Inter"
                    font.pixelSize: 20
                    font.weight: Font.DemiBold
                    color: "#FFFFFF"

                    anchors.centerIn: parent
                }
            }

            Rectangle {
                anchors.fill: parent
                color: "#00000000"
                radius: 30
                border.color: ripple.running ? "#4B3EF4" : "#00000000"

                PropertyAnimation {
                    id: ripple
                    target: rectangle
                    property: "scale"
                    from: 0
                    to: 1
                    duration: 500
                    easing.type: Easing.OutQuad
                }
            }
        }
    }
}
