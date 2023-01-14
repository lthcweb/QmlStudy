import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    id:window
    width: 640
    height: 480
    visible: true
    title: qsTr("P18_Signal")
    color:'white'

///////////////////////    第一部分
    signal testSig(string s,int value)

    function func(ss, ii) {
        console.log(ss,ii)
    }

    Button{
        width: 100
        height:50
        text: 'Click'
        onClicked: {
            testSig("zhangsan",99)
        }

        Component.onCompleted: {
            testSig.connect(func)
        }

        Connections{
            target:window

//            这种方式不推荐使用
//            onTestSig:{
//                console.log("ss, ii")
//            }

//            推荐这种方式
            function onTestSig(str,n) {
                console.log(str,n)
            }
        }
    }



///////////////////////    第二部分
    Component{
        id:com
        Button{
            id:btn
            width:100
            height:30
            background:Rectangle{
                anchors.fill: parent
                border.color:btn.activeFocus?"blue":"black"
            }

            signal btnSig(int value)
            onClicked:{
                btnSig(10)
            }

//            按键盘左箭头
            signal leftBtnPressed()
            Keys.onLeftPressed: {
                leftBtnPressed()
            }
        }
    }

    MyComponent{
        com1:com
        com2:com
    }
}
