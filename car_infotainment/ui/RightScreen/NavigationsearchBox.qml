import QtQuick 2.15

Rectangle {
    id: searchBox
    radius:5
    color: "#f7fcff"

    Image {
        id: searchIcon

        anchors {
            left: parent.left
            leftMargin: 19
            verticalCenter: parent.verticalCenter
        }

        height: parent.height * .45
        fillMode: Image.PreserveAspectFit
        source: "qrc:/ui/assets/search_icon.png"

        Text {
            id:navTitle
            visible: NavigationsearchBox.text === ""
            anchors{
                left: parent.left
                leftMargin: 40
                verticalCenter: parent.verticalCenter
            }
            text: qsTr("Navigation")
            color: "#c7c7c7"
        }

        TextInput{
            id: navTextInput

            anchors {
                left: parent.left
                leftMargin: 40
                verticalCenter: parent.verticalCenter
            }

            text: "Navigation"
            cursorVisible: true
        }
    }
}
