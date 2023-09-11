import QtQuick 2.0

Rectangle {
    id: bottombar
    anchors{
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    color: "black"
    height: parent.height / 12

    Image {
        id: carSettingsIcon
        anchors{
            left: parent.left
            leftMargin: 30
            verticalCenter: parent.verticalCenter
        }

        height: parent.height * .85
        fillMode: Image.PreserveAspectFit

        source: "qrc:/ui/assets/car_icon.png"
    }

    HVACComponent {
        id: driverHVAC
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: carSettingsIcon.right
            leftMargin: 150
        }

        hvacController: driverHVAC
    }

    HVACComponent {
        id: passengerHVAC
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            rightMargin: 250
        }
        hvacController: passengerHVAC
    }

    Image {
        id: thirdPartyApp
        anchors{
            left: driverHVAC.right
            leftMargin: 150
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * .85
        fillMode: Image.PreserveAspectFit
        source: "qrc:/ui/assets/thirdParty.png"

    }
}
