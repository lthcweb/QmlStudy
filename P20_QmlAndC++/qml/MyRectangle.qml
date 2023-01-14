import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    width:200
    height:100
    border.color: 'blue'
    color: 'black'

    property int testValue:0

//    property alias attr:privateAttr
//    私有property用以下方式定义
    QtObject{
        id:privateAttr
        property int _testValue:50
    }


}
