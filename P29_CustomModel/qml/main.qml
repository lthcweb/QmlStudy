import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

import MyModel 1.0


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("P29_CustomModel")


    ListView{
        width:200
        height:300
       model:MyListModel
       delegate:Text{
            text:name+ " " + value
       }
    }

}
