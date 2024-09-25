import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.LocalStorage 2.0

Window {
    width: 1280
    height: 800
    visible: true

    // Function to get database handle
    function getDatabase() {
        return LocalStorage.openDatabaseSync("UserDetails", "1.0", "User Details Storage", 100);
    }

    // Function to initialize the database
    function initializeDatabase() {
        var db = getDatabase();
        db.transaction(function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS Details (id INTEGER PRIMARY KEY AUTOINCREMENT, contact TEXT, email TEXT, website TEXT)');
        });
    }

    // Function to save details to the database
    function saveDetails(contact, email, website) {
        var db = getDatabase();
        db.transaction(function(tx) {
            tx.executeSql('DELETE FROM Details'); // Clear previous values
            tx.executeSql('INSERT INTO Details (contact, email, website) VALUES (?, ?, ?)', [contact, email, website]);
        });
    }

    // Function to load details from the database
    function loadDetails() {
        var db = getDatabase();
        db.transaction(function(tx) {
            var result = tx.executeSql('SELECT * FROM Details');
            if (result.rows.length > 0) {
                numberText.text = result.rows.item(0).contact || "";
                emailID.text = result.rows.item(0).email || "";
                webID.text = result.rows.item(0).website || "";
            }
        });
    }

    // Load details when the application starts
    Component.onCompleted: {
        initializeDatabase();
        loadDetails();
    }

    Image {
        id: backgroundImage
        source: "qrc:/data/Welcome-screen.png"
        anchors.fill: parent
    }

    Item {
        width: parent.width
        height: parent.height
        anchors.top: parent.top
        anchors.topMargin: 70*4

        Row {
            spacing: 55
            anchors.horizontalCenter: parent.horizontalCenter

            // Contact Number Section
            Column {
                spacing: 5

                Row {
                    spacing: 10

                    Image {
                        id: contactIcon
                        source: "qrc:/data/contactIcon.png"
                        width: 60
                        height: 60
                    }

                    Text {
                        id: contactNumberText
                        text: qsTr("Contact Number")
                        color: "yellow"
                        font.family: "Arial"
                        font.bold: true
                        font.pointSize: 30
                        font.italic: false
                    }
                }

                Row {
                    spacing: 10

                    TextField {
                        id: numberText
                        placeholderText: qsTr("Contact Number")
                        font.family: "Arial"
                        font.pointSize: 20
                        font.italic: false
                        color: "white"
                        background: null
                    }
                }

                Rectangle {
                    width: parent.width
                    height: 1
                    color: "white"
                }
            }

            // Email Section
            Column {
                spacing: 5

                Row {
                    spacing: 10

                    Image {
                        id: emailIcon
                        source: "qrc:/data/mailIcon.png"
                        width: 60
                        height: 60
                    }

                    Text {
                        id: emailText
                        text: qsTr("Email")
                        color: "yellow"
                        font.family: "Arial"
                        font.bold: true
                        font.pointSize: 30
                        font.italic: false
                    }
                }

                Row {
                    spacing: 10

                    TextField {
                        id: emailID
                        placeholderText: qsTr("abcd@gmail.com")
                        font.pointSize: 20
                        font.italic: false
                        color: "white"
                        background: null
                    }
                }

                Rectangle {
                    width: parent.width
                    height: 1
                    color: "white"
                }
            }

            // Website Section
            Column {
                spacing: 5

                Row {
                    spacing: 10

                    Image {
                        id: webIcon
                        source: "qrc:/data/websiteIcon.png"
                        width: 60
                        height: 60
                    }

                    Text {
                        id: websiteText
                        text: qsTr("Website")
                        color: "yellow"
                        font.family: "Arial"
                        font.bold: true
                        font.pointSize: 30
                        font.italic: false
                    }
                }

                Row {
                    spacing: 10

                    TextField {
                        id: webID
                        placeholderText: qsTr("www.abcd.com")
                        font.pointSize: 20
                        font.italic: false
                        color: "white"
                        background: null
                    }
                }

                Rectangle {
                    width: parent.width
                    height: 1
                    color: "white"
                }
            }
        }
    }

    // Save button to store the details when clicked
    Button {
        text: qsTr("Save Details")
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            saveDetails(numberText.text || numberText.placeholderText,
                        emailID.text || emailID.placeholderText,
                        webID.text || webID.placeholderText);
        }
    }
}
