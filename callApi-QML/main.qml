import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: "API Call Example"

    Column {
        spacing: 10
        anchors.centerIn: parent

        Button {
            text: "Call API"
            onClicked: callApi()
        }

        TextArea {
            id: responseText
            width: parent.width - 20
            height: 200
            readOnly: true
        }
    }

    function callApi() {
        var xhr = new XMLHttpRequest()
        var url = "https://jsonplaceholder.typicode.com/todos/1";
        xhr.open("GET", url)
        xhr.setRequestHeader("Accept", "application/json")
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                console.log("Response Text: " + xhr.responseText)
                if (xhr.status === 200) {
                    try {
                        var response = JSON.parse(xhr.responseText)
                        console.log("Parsed Response: " + JSON.stringify(response))
                        if (response.success) {
                            responseText.text = "Message: " + response.mesage
                        } else {
                            responseText.text = "Request was not successful."
                        }
                    } catch (e) {
                        console.log("JSON Parse Error: " + e)
                        responseText.text = "Failed to parse JSON. See console for details."
                    }
                } else {
                    console.log("HTTP Error: " + xhr.status + " - " + xhr.statusText)
                    responseText.text = "HTTP Error: " + xhr.status + " - " + xhr.statusText
                }
            }
        }
        xhr.send()
    }
}
