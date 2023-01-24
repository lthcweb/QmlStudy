import QtQuick 2.15
import QtQuick.Controls 2.15

import "../Controls"

BaseTabBar{
    id: bar
    height: 48
    width: parent.width
    Component.onCompleted: {
        myModel.append({ "modelText": "媒体",  "modelSrc": "qrc:/images/media.svg"})
        myModel.append({ "modelText": "播放列表", "modelSrc": "qrc:/images/playlist.svg"})
        myModel.append({ "modelText": "播放",  "modelSrc": "qrc:/images/play.svg"})
        myModel.append({ "modelText": "下载",  "modelSrc": "qrc:/images/download.svg"})
        myModel.append({ "modelText": "设置",  "modelSrc": "qrc:/images/settings.svg"})
    }
}
