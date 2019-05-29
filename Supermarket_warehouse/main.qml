import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12


ApplicationWindow {
    id: rootWindow
    visible: true
    width: 800
    height: 600
    minimumWidth: 700
    minimumHeight: 400
    title: qsTr("Supermarket")


    FontLoader {
        id: fontAwesome
        name: "fontawesome"
        source: "qrc:/Font Awesome 5 Free-Solid-900.otf"
    }

    // Main stackview
    StackView {
        id: stackView
        focus: true
        anchors.fill: parent
    }

    // Replace this with some other action that changes the source.
    Component.onCompleted: stackView.push("LoginPage.qml")

    //Popup to show messages or warnings on the bottom postion of the screen
//    Popup {
//        id: popup
//        property alias popMessage: message.text

//        background: Rectangle {
//            implicitWidth: rootWindow.width
//            implicitHeight: 60
//            color: backGroundColor
//        }
//        y: (rootWindow.height - 60)
//        modal: true
//        focus: true
//        closePolicy: Popup.CloseOnPressOutside
//        Text {
//            id: message
//            anchors.centerIn: parent
//            font.pointSize: 12
//            color: mainTextCOlor
//        }
//        onOpened: {
//            popupClose.start()
//            runIndicator = false
//        }
//    }

//    // Popup will be closed automatically in 2 seconds after its opened
//    Timer {
//        id: popupClose
//        interval: 2000
//        onTriggered: popup.close()
//    }

//    Dialog {
//        id: infoDialog
//        property alias popMessage: textInfo.text

//        title: "Information"
//        standardButtons: Dialog.Ok
//        onAccepted: this.close()
//        background: Rectangle {
//            color: backGroundColor
//            border.color: friendListColor
//        }
//        //anchros.horizontalCenter: parent.horizontalCenter
//        //anchors.top: parent.top
//        y: 50
//        height: 50
//        width: 300

//        Text {
//            id: textInfo
//            color: mainTextCOlor
//        }

//    }

//    Timer {
//        id: infoClose
//        interval: 3000
//        onTriggered: infoDialog.close()
//    }
}
