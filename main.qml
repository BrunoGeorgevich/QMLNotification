import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2

ApplicationWindow {
    visible:true
    height:800
    width:600

    ColumnLayout {
        anchors.centerIn: parent
        width:parent.width/2
        height: parent.height/3

        RowLayout {

            Layout.fillWidth: true
            Layout.fillHeight: true

            Rectangle {
                id:txtInputRect
                color: "white"

                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumHeight: txtInput.contentHeight

                radius: height/10

                TextInput {
                    id:txtInput

                    anchors.fill: parent

                    verticalAlignment: TextInput.AlignVCenter
                    clip: true
                }
            }

            CheckBox {
                id:checkBox
                checked: true
            }
        }

        Slider {
            id:opacitySlider
            Layout.fillWidth: true
            Layout.fillHeight: true

            maximumValue: 1
            minimumValue: 0
            value: 0.7

        }

        Slider {
            id:intervalSlider
            Layout.fillWidth: true
            Layout.fillHeight: true

            maximumValue: 10000
            minimumValue: 1000
            value: 2000

        }

        Button {
            Layout.fillWidth: true
            Layout.fillHeight: true

            text:"Show Notification!"
            onClicked: notifySystem.coloredNotify(txtInput.text,"green")
        }

        Button {
            Layout.fillWidth: true
            Layout.fillHeight: true

            text:"Alert Notification!"
            onClicked: notifySystem.coloredNotify(txtInput.text,"#FFBF00")
        }

        Button {
            Layout.fillWidth: true
            Layout.fillHeight: true

            text:"Warning Notification!"
            onClicked: notifySystem.coloredNotify(txtInput.text,"red")
        }
    }

    NotificationSystem {
        id:notifySystem
        timeInterval: intervalSlider.value
        onTheTop: checkBox.checked
        opacity: opacitySlider.value
    }
}
