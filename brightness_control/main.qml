import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0

Window {
    width: 3840
    height: 720
    visible: true
    title: qsTr("Display Brightness Control")
    color: "#7D5FA7"

    property real brightnessRange: 1

    Rectangle {
        id: brightness
        width: 949
        height: 586
        radius: 50
        color: "#3a0654"

        Rectangle {
            width: 806.65
            height: 60
            radius: 50
            anchors {
                top: parent.top
                topMargin: 40
                left: parent.left
                leftMargin: 40
            }

            Slider {
                width: parent.width
                anchors.centerIn: parent
                from: 0.1
                to: brightnessRange
                onValueChanged: {
                    console.log("Slider value changed to:", value);
                    brightness_Control.setBrightness(value);
                }
            }
        }
    }
}
