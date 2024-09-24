import QtQuick 2.15
import QtQuick.Window 2.15
import Qt.labs.settings 1.0 // Import the Settings module

Window {
    width: 1280
    height: 800
    visible: true
    title: qsTr("Stretching Slider")

    property real brightnessValue: 0.0 // Variable to store the slider value (0 to 1)

    // Settings component to store brightness value
    Settings {
        id: brightnessSettings
        property real savedBrightness: 0.5 // Default brightness if nothing is stored
    }

    // Load the saved brightness value when the application starts
    Component.onCompleted: {
        brightnessValue = brightnessSettings.savedBrightness;
        // Set the innerRect width according to the saved brightness value
        innerRect.width = brightnessValue * (outerRect.width - 5) + 5;
    }

    Image {
        id: backgroundImage
        source: "qrc:/assets/Welcome-screen.png"
        anchors.fill: parent
    }

    Text {
        text: "Brightness"
        font.family: "Arial"
        font.pointSize: 40
        color: "white"
        anchors {
            left: parent.left
            leftMargin: 60*3
            bottom: outerRect.top
            bottomMargin: 40
        }
    }

    // Outer Rectangle (Red color - the slider track)
    Rectangle {
        id: outerRect
        width: 450 // Fixed width of the outer rectangle (slider track)
        height: 50
        color: "white"
        radius: 30
        border.color: "#193773"
        anchors {
            left: parent.left
            leftMargin: 60
            verticalCenter: parent.verticalCenter
        }

        // Inner Rectangle (Slider handle)
        Rectangle {
            id: innerRect
            width: 50 // Initial width of the slider handle
            height: outerRect.height
            radius: 30
            x: 0 // Fix the x position to the left edge of the outerRect

            gradient: Gradient {
                GradientStop {
                    position: 0.00
                    color: "#254e9a"  // Left color
                }
                GradientStop {
                    position: 0.50
                    color: "#193773"  // Center color
                }
                GradientStop {
                    position: 1.00
                    color: "#1b3f7d"  // Right color
                }
            }

            Image {
                id: sunIcon
                source: "qrc:/assets/sun.png"
                height: 30
                width: 30
                anchors {
                    right: innerRect.right
                    rightMargin: 10
                    verticalCenter: innerRect.verticalCenter
                }
            }

            // MouseArea to handle dragging
            MouseArea {
                id: sliderMouseArea
                anchors.fill: parent
                drag.axis: Drag.XAxis // Only allow horizontal dragging

                // Constrain the dragging within the bounds of outerRect
                onPositionChanged: {
                    // Calculate new width based on drag position
                    innerRect.width = Math.max(50, sliderMouseArea.mouseX);

                    // Prevent the width from exceeding the outer rectangle's width
                    if (innerRect.width > outerRect.width) {
                        innerRect.width = outerRect.width;
                    }

                    // Calculate brightness value based on slider position (0 to 1)
                    brightnessValue = (innerRect.width - 5) / (outerRect.width - 5);

                    // Store the brightness value in the settings
                    brightnessSettings.savedBrightness = brightnessValue;

                    // Output brightness value for debugging
                    console.log("Brightness Value (0 to 1):", brightnessValue);
                    brightnessControl.setBrightness(brightnessValue)
                }

                onReleased: {
                    console.log("Released at value (0 to 1): ", brightnessValue)
                }
            }
        }
    }
}
