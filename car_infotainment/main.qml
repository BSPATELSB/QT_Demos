import QtQuick 2.0
import QtQuick.Window 2.0

import "ui/BottomBar"
import "ui/RightScreen"
import "ui/LeftScreen"

Window {
    width: 1280
    height: 720
    visible: true
    title: qsTr("Car_Infotainment")



    LeftScreen {
        id: leftScreen
    }

    RightScreen {
        id: rightScreen
    }

    BottomBar{
        id: bottombar
    }
}
