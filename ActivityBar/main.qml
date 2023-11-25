import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Activity")

    Rectangle {
        height: 435
        width: 302
        radius: 29
        color: "#111111"

        anchors.centerIn: parent

        Rectangle {
            id:topSquare
            height: 80
            width: 302
            color: "#181818"
            radius: 29

            Text {
                text: qsTr("Activity")
                color: "white"
                font.bold: true
                font.family: "Inter"
                font.pointSize: 15

                anchors {
                    top: parent.top
                    topMargin: 25
                    left: parent.left
                    leftMargin: 16
                }
            }
        }

        Rectangle {
            id:firstRec
            height: 80
            width: 275
            color: "#1c1c1c"
            radius: 15

            TextArea {
                   id:model3Text
                   text: qsTr("Non Stop")
                   color: "white"
                   font.bold: false
                   font.weight:DemiBold
                   font.family: "Inter"
                   font.pointSize: 13
                   anchors {
                       top: parent.top
                       topMargin: 8
                       right: model3.right
                       rightMargin: -40*2
                   }
               }

            Text {
                id:firstRecText
                text: qsTr("RadioHead")
                color: "grey"
                font.bold: false
                font.weight:DemiBold
                font.family: "Inter"
                font.pointSize: 11
                anchors {
                    right: model3.right
                    rightMargin: -26*3
                    bottom: model3Text.bottom
                    bottomMargin: -20
                }
            }

//            Image {
//                id: firstRecIcon
//                source: "qrc:/Resources/rec1.png"
//                anchors {
//                    bottom: firstRecText.bottom
//                    bottomMargin: -20
//                    right: parent.right
//                    rightMargin: 36*5
//                }
//            }

            anchors {
                top: parent.top
                topMargin: 25*4
                left: parent.left
                leftMargin: 14
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                // Change the color on hover
                onEntered: parent.color = "#3c3e3c"
                onExited: parent.color = "#1c1c1c"
            }

            AnimatedImage {
                id: animatedGif
                source: "qrc:/Resources/audio.gif"
                anchors {
                    right: firstRec.right
                    rightMargin: 10
                    bottom: firstRec.bottom
                    bottomMargin: 15
                }
            }

            Image {
                id: model3
                source: "qrc:/Resources/model3.png"
                anchors {
                    top: firstRec.top
                    topMargin: 3
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: model3.scale = 1.1
                    onExited: model3.scale = 1.0
                    onPressed: model3.scale = 0.9
                    onReleased: model3.scale = 1.0
                }
            }

        }

        Rectangle {
            id:secRec
            height: 80
            width: 275
            color: "#1c1c1c"
            radius: 15

            TextArea {
                   id:model2Text
                   text: qsTr("RadioActive")
                   color: "white"
                   font.bold: false
                   font.weight:DemiBold
                   font.family: "Inter"
                   font.pointSize: 13
                   anchors {
                       top: parent.top
                       topMargin: 8
                       right: model2.right
                       rightMargin: -50*2
                   }
               }

            Text {
                text: qsTr("Poshallya")
                color: "grey"
                font.bold: false
                font.weight:DemiBold
                font.family: "Inter"
                font.pointSize: 11
                anchors {
                    right: model2.right
                    rightMargin: -24*3
                    bottom: model2Text.bottom
                    bottomMargin: -20
                }
            }

            anchors {
                top: parent.top
                topMargin: 25*8
                left: parent.left
                leftMargin: 14
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                // Change the color on hover
                onEntered: parent.color = "#3c3e3c"
                onExited: parent.color = "#1c1c1c"
            }

            AnimatedImage {
                source: "qrc:/Resources/audio.gif"
                anchors {
                    right: secRec.right
                    rightMargin: 10
                    bottom: secRec.bottom
                    bottomMargin: 15
                }
            }

            Image {
                id: model2
                source: "qrc:/Resources/model1.png"
                anchors {
                    top: secRec.top
                    topMargin: 3
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: model2.scale = 1.1
                    onExited: model2.scale = 1.0
                    onPressed: model2.scale = 0.9
                    onReleased: model2.scale = 1.0
                }
            }
        }

        Rectangle {
            id:thirdRec
            height: 80
            width: 275
            color: "#1c1c1c"
            radius: 15

            TextArea {
                   id:model1Text
                   text: qsTr("10 Steps")
                   color: "white"
                   font.bold: false
                   font.weight:DemiBold
                   font.family: "Inter"
                   font.pointSize: 13
                   anchors {
                       top: parent.top
                       topMargin: 8
                       right: model1.right
                       rightMargin: -40*2
                   }
               }

            Text {
                text: qsTr("Imagine")
                color: "grey"
                font.bold: false
                font.weight:DemiBold
                font.family: "Inter"
                font.pointSize: 11
                anchors {
                    right: model1.right
                    rightMargin: -21*3
                    bottom: model1Text.bottom
                    bottomMargin: -20
                }
            }

            anchors {
                top: parent.top
                topMargin: 25*12
                left: parent.left
                leftMargin: 14
            }


            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                // Change the color on hover
                onEntered: parent.color = "#3c3e3c"
                onExited: parent.color = "#1c1c1c"
            }

            AnimatedImage {
                source: "qrc:/Resources/audio.gif"
                anchors {
                    right: thirdRec.right
                    rightMargin: 10
                    bottom: thirdRec.bottom
                    bottomMargin: 15
                }
            }

            Image {
                id: model1
                source: "qrc:/Resources/model2.png"
                anchors {
                    top: thirdRec.top
                    topMargin: 3
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: model1.scale = 1.1
                    onExited: model1.scale = 1.0
                    onPressed: model1.scale = 0.9
                    onReleased: model1.scale = 1.0
                }
            }

        }

    }

}
