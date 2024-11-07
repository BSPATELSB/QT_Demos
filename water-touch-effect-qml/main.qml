import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Realistic Sea Wave Animation"

    Canvas {
        id: waveCanvas
        anchors.fill: parent

        onPaint: {
            var context = getContext("2d");
            context.clearRect(0, 0, width, height);

            // Realistic wave drawing with smoother layering and gentle motion
            for (var i = 0; i < 3; i++) {
                var amplitude = 20 + i * 10;  // Amplitudes closer together for smoother layering
                var frequency = 0.009 + i * 0.001; // Low frequency for gentle wave oscillation
                var speed = frame * (0.5 + i * 0.1);  // Very slow movement for realism
                var offset = i * 30;

                context.beginPath();
                context.moveTo(0, height / 2);

                for (var x = 0; x <= width; x++) {
                    var y = height / 2 + Math.sin((x + speed) * frequency) * amplitude + offset;
                    context.lineTo(x, y);
                }

                context.lineTo(width, height);
                context.lineTo(0, height);
                context.closePath();

                // Naturalistic wave colors
                context.fillStyle = `rgba(70, 130, 180, ${0.4 - i * 0.1})`;
                context.fill();
            }
        }

        property int frame: 0
        Timer {
            interval: 5 // Slower timer interval for a gentle, realistic motion
            running: true
            repeat: true
            onTriggered: {
                waveCanvas.frame += 1;
                waveCanvas.requestPaint();
            }
        }
    }
}
