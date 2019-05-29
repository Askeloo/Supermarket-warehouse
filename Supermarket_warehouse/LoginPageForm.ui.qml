import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Page {
    id: loginPage
    property alias btLogInSMWorker: btLogInSMWorker
    property alias btLogInWHWorker: btLogInWHWorker

    property color backgroundColor: "#161616"
    property color mainTextColor: "#fc3f1e"
    property color borderColor: "#ffffff"

    contentWidth: 0
    contentHeight: -1
    focusPolicy: Qt.WheelFocus
    spacing: 4

    background: Rectangle {
        color: backgroundColor
    }

    Rectangle {
        id: textRect
        width: parent.width
        height: parent.height / 2
        color: backgroundColor
        border.width: 0
        transformOrigin: Item.Center
        Text {
            id: mainLabel
            anchors.fill: parent
            text: qsTr("Log into supermarket as:")
            color: mainTextColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "fontawesome"
            font.pointSize: 30
        }
    }

    ColumnLayout {
        id: columnLogin
        width: 320
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: textRect.bottom
        spacing: 10

        Button {
            id: btLogInSMWorker
            width: 323
            implicitWidth: parent.width
            text: qsTr("Supermarket worker")
            focusPolicy: Qt.WheelFocus
            font.pointSize: 16
            font.family: "fontawesome"
            contentItem: Text {
                font: btLogInSMWorker.font
                color: mainTextColor
                text: btLogInSMWorker.text
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 50
                color: "transparent"
                opacity: btLogInSMWorker.down ? 0.7 : 1
                radius: height / 3
                border.color: borderColor
            }
        }

        Button {
            id: btLogInWHWorker
            implicitWidth: parent.width
            text: qsTr("Warehouse worker")
            display: AbstractButton.IconOnly
            focusPolicy: Qt.NoFocus
            Layout.fillWidth: false
            font.pointSize: 16

            //font.family: "fontawesome"
            contentItem: Text {
                text: btLogInWHWorker.text
                font: btLogInWHWorker.font
                color: mainTextColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 50
                color: "transparent"
                opacity: btLogInWHWorker.down ? 0.7 : 1
                radius: height / 3
                border.color: borderColor
            }
        }
    }
}




/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
