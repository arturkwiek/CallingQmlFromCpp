import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Connections C++ Demo")

    Connections {
        target: CppSignalSender
        onCallQml: {
            console.log("CallQml signal cought")
            mText.text = parameter
        }
        onCppTimer: {
            console.log("cppTimer signal cought")
            mRectText.text = value
        }
    }

    Column {
        Rectangle {
            width: 100
            height: 100
            color: "red"

            Text {
                id: mRectText
                text: qsTr("0")
                font.pointSize: 30
                color: "white"
                anchors.centerIn: parent
            }
        }

        Button {
            id: btnCall
            text: "Call C++ Method"
            onClicked: {
                CppSignalSender.cppSlot()
            }
        }
        Text {
            id: mText
            text: qsTr("Default")
        }
    }
}
