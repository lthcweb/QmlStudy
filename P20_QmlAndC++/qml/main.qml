import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import MyObj 1.0    // qmlRegisterType注册的

Window {
    id:window
    width: SCREEN_WIDTH
    height: 480
    visible: true
    title: qsTr("P20_QmlAndC++")
    color:'white'

//  动态绑定
    property int value:myobj.iValue

    MyRectangle{
        Component.onCompleted: {
//            privateAttr._testValue = 200
//            console.log(privateAttr._testValue)
        }
    }

    MyObject{
        id:myobj
        iValue:10
        sString:"zhangsan"

        Component.onCompleted: {
            console.log(iValue,sString)
//            赋值不会动态绑定
//            value = width
        }
    }

    onValueChanged: {
        console.log(value)
    }


    /********** P22 槽函数***********************/
    //    定义
    signal qmlSig(int i, string s)

    // qml->c++ 绑定槽函数的方法一
//    Connections{
//        target:window
//        function onQmlSig(i,s){
//            myobj.cppSlot(i,s)
//        }
//    }

    // qml->c++ 绑定槽函数方法二
    Component.onCompleted: {
        qmlSig.connect(myobj.cppSlot)
    }

    // qml->c++ 绑定槽函数的方法三，在cpp端实现，见 main.cpp

    Button{
        text:"Qml->Cpp"
        onClicked:{
            myobj.iValue = 20
            myobj.func()

            qmlSig(10,"Qml->Cpp")
            //myobj.cppSig(20,"pp->Qml")
        }
    }



    /********** P23 ***********************/

    function qmlSlot(i,s){
        console.log("qml",i,s)
    }

    // c++->qml 绑定槽函数的方法一
//    Connections{
//        target:myobj
//        function onCppSig(i,s){
//            qmlSlot(i,s)
//        }
//    }

    // 常用方式
    // c++->qml 绑定槽函数的方法二，

    Connections{
        target:MyObject1
        function onCppSig(i,s){
            qmlSlot(i,s)
        }
    }

    // 在cpp端用qmlRegisterSingletonInstance实现,这样不用实例化MyObject

    Button{
        id:btn2
       text:"Cpp->Qml"
       x:parent.width/2

       onClicked:{
           MyObject1.func()
       }
    }



    /********** P24 从c++调用qml函数***********************/

    function qmlFunc(i, s){
        console.log(i,s)
        return "success"
    }
}
