/*!
 *@file BaseTabBar.qml
 *@brief 自定义TabBar
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

import "../"

TabBar {
    property alias myModel: myModel
//    property int lastIndex: 0

    id: bar
    currentIndex: 0

    ListModel {
        id: myModel
    }

    Repeater {
        id: repeater
        model: myModel

        TabButton {
            property alias imageSource: image.source
            property alias textColor: text.color
            anchors.top: parent.top
            anchors.topMargin: 5

            height: bar.height
            contentItem:Text{
                id: text
                text: modelText
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignBottom
                color: Global.quaternary
                opacity: bar.currentIndex===model.index? 1:0.5
            }
            background:Image{
                id: image
                width: 24
                height: 24
                anchors.horizontalCenter: parent.horizontalCenter
                source: modelSrc
                opacity: bar.currentIndex===model.index? 1:0.5
                ColorOverlay {
                    anchors.fill: parent
                    source: parent
                    color: Global.quaternary
                }


            }
//            onHoveredChanged: {
//                if (model.index !== bar.currentIndex){
//                    hovered ? text.color = modelColorG : text.color = modelColor
//                    hovered ? image.source = modelSrcG : image.source = modelSrc
//                }
//            }
            onClicked: {
//                repeater.itemAt(bar.lastIndex).imageSource = myModel.get(bar.lastIndex).modelSrc;
//                repeater.itemAt(bar.lastIndex).textColor = modelColor;

//                image.source = modelSrcG;
//                text.color = modelColorG;
                bar.currentIndex = model.index;
            }
        }
    }
}
