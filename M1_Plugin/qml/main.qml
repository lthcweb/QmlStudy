import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import XQuick 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Item {
        anchors.fill: parent
        XButton {
            btnColor: "blue"
            onClick: {
                console.log("我被点击了 "+ test.fileName )
                console.log(TestSingleton.settingsFileName)
            }
        }
    }


    Button{
       id:btn
       text:'BUTTON'
       background:Rectangle{
            anchors.fill: parent
            color:'grey'
       }
    }

    Test{
        id:test

    }

}
