import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("P26_Layout")


    Grid{
        id:grid
        width:15
        height:200
        columns:3
        x:300
        y:100
        visible:false
        Repeater{
            // 这里model绑定width和height，每当width和height改变时，Repeater将会重绘
            // 如果想节约资源不重绘，可以改成固定值
            // model:grid.width / 5 * grid.height / 5
            model:grid.width / 5 * 200 / 5
            Rectangle{
                width:5
                height:5
                color:index % 2 ? 'black':'white'
                Component.onCompleted: {
                    console.log("rect:" + index)
                }
            }
        }
    }

    Button{
        width:50
        height:50
        x:100
        y:100
        onClicked:{
            grid.height -= 10
        }
    }


    Rectangle{
        id:mask
        width:grid.width +4
        height:grid.height +4
        border.color:'blue'
        radius:10
        border.width:3
        anchors.horizontalCenter:parent.horizontalCenter
        anchors.bottom:parent.bottom
        OpacityMask{
            source:grid
            maskSource:mask
            anchors.fill: parent
            anchors.margins: 2
        }
    }
}
