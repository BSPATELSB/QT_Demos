import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Accurate Clock"

    Rectangle {
        id: clock
        width: 300
        height: 300
        anchors.centerIn: parent
        color: "#fefbf2"
        border.color: "#b06a26"
        border.width: 20
        radius: width / 2

        // Function to set the clock hands to the exact current time
        function updateClock() {
            var date = new Date();
            var hours = date.getHours();
            var minutes = date.getMinutes();
            var seconds = date.getSeconds();

            // Set rotations based on current time
            hourHand.rotation = (hours % 12 + minutes / 60) * 30; // 360 / 12 = 30 degrees per hour
            minuteHand.rotation = (minutes + seconds / 60) * 6;    // 360 / 60 = 6 degrees per minute
            secondHand.rotation = seconds * 6;                     // 360 / 60 = 6 degrees per second
        }

        // Timer for precise updates
        Timer {
            id: clockTimer
            interval: 1000 // 1 second
            running: true
            repeat: true
            onTriggered: {
                clock.updateClock()
            }
        }

        // Initial setup to align timer with system time
        Component.onCompleted: {
            updateClock(); // Set initial time

            // Calculate remaining milliseconds until the start of the next second
            var date = new Date();
            var remainingTime = 1000 - date.getMilliseconds();

            // Start the clockTimer after this initial delay to synchronize
            Qt.callLater(function() {
                clockTimer.start();
            }, remainingTime);
        }

        // Hour hand
        Rectangle {
            id: hourHand
            width: 10
            height: 80
            radius: 5
            color: "black"
            anchors.top: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            transformOrigin: Item.Top
        }

        // Minute hand
        Rectangle {
            id: minuteHand
            width: 10
            height: 100
            radius: 5
            color: "black"
            anchors.top: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            transformOrigin: Item.Top
        }

        // Second hand
        Rectangle {
            id: secondHand
            width: 5
            height: 120
            radius: 2.5
            color: "red"
            anchors.top: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            transformOrigin: Item.Top
        }

        // Center of clock
        Rectangle {
            width: 20
            height: 20
            radius: 10
            color: "#b06a26"
            anchors.centerIn: parent
            z: 1
        }

        // Clock markers at 12, 3, 6, and 9 positions
        Rectangle {
            width: 10
            height: 10
            radius: 5
            color: "black"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: -clock.height / 2 + 35
            anchors.verticalCenter: parent.verticalCenter
            z: 2
        }

        Rectangle {
            width: 10
            height: 10
            radius: 5
            color: "black"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: clock.height / 2 - 35
            anchors.verticalCenter: parent.verticalCenter
            z: 2
        }

        Rectangle {
            width: 10
            height: 10
            radius: 5
            color: "black"
            anchors.horizontalCenterOffset: -clock.width / 2 + 35
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            z: 2
        }

        Rectangle {
            width: 10
            height: 10
            radius: 5
            color: "black"
            anchors.horizontalCenterOffset: clock.width / 2 - 35
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            z: 2
        }
    }
}
