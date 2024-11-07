import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    color: "#eee"

    // Container for the animated circle parts
    Item {
        id: partA
        width: 200
        height: 200
        anchors.centerIn: parent

        // Outer animation layer
        Rectangle {
            width: 200
            height: 200
            radius: 100
            anchors.centerIn: parent
            gradient: Gradient {
                GradientStop { position: 0.6; color: "#f16023" }
                GradientStop { position: 1.0; color: "#f16050" }
            }
            SequentialAnimation on scale {
                loops: Animation.Infinite
                NumberAnimation { from: 0.5; to: 1.5; duration: 9000 }
            }
            SequentialAnimation on opacity {
                loops: Animation.Infinite
                NumberAnimation { from: 0.0; to: 1.0; duration: 4500 }
                NumberAnimation { from: 1.0; to: 0.0; duration: 4500 }
            }
        }

        // Middle animation layer
        Rectangle {
            width: 200
            height: 200
            radius: 100
            anchors.centerIn: parent
            gradient: Gradient {
                GradientStop { position: 0.6; color: "#f16023" }
                GradientStop { position: 1.0; color: "#f16050" }
            }
            SequentialAnimation on scale {
                loops: Animation.Infinite
                NumberAnimation { from: 0.5; to: 1.5; duration: 6000 }
            }
            SequentialAnimation on opacity {
                loops: Animation.Infinite
                NumberAnimation { from: 0.0; to: 1.0; duration: 3000 }
                NumberAnimation { from: 1.0; to: 0.0; duration: 3000 }
            }
        }

        // Inner animation layer
        Rectangle {
            width: 200
            height: 200
            radius: 100
            anchors.centerIn: parent
            gradient: Gradient {
                GradientStop {
                    position: 0.60;
                    color: "#ea9370";
                }
                GradientStop {
                    position: 1.00;
                    color: "#f16050";
                }
            }
            SequentialAnimation on scale {
                loops: Animation.Infinite
                NumberAnimation { from: 0.5; to: 1.5; duration: 3000 }
            }
            SequentialAnimation on opacity {
                loops: Animation.Infinite
                NumberAnimation { from: 0.0; to: 1.0; duration: 1500 }
                NumberAnimation { from: 1.0; to: 0.0; duration: 1500 }
            }
        }
    }

    // Button in the center
    Rectangle {
        id: btn
        width: 80
        height: 80
        radius: 40
        color: "#0067b6"
        anchors.centerIn: parent
        border.color: "#eee"
        border.width: 0
        Text {
            anchors.centerIn: parent
            text: "Btn"
            color: "#eee"
            font.bold: true
            font.family: "Tahoma"
            font.pixelSize: 16
        }
        states: State {
            name: "hovered"
            when: btn.containsMouse
            PropertyChanges { target: btn; scale: 1.05 }
            PropertyChanges { target: btn; border.width: 12; border.color: "#eee" }
        }
        transitions: Transition {
            NumberAnimation { properties: "scale, border.width"; duration: 500 }
        }
        MouseArea {
            id: btnMouseArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                // Define the action you want on button click
                console.log("Button clicked")
            }
        }
    }
}
