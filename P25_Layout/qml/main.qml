import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("P25_Layout")

   Column{
      Rectangle{
        width:300
        height:300
        border.color:'blue'
        Grid {
            columns: 3
            spacing: 2
            Rectangle { color: "red"; width: 50; height: 50 }
            Rectangle { color: "green"; width: 20; height: 40 }
            Rectangle { color: "blue"; width: 50; height: 20 }
            Rectangle { color: "cyan"; width: 50; height: 50 }
            Rectangle { color: "magenta"; width: 10; height: 10 }
        }
      }






//    Rectangle{
//        width:300
//        height:200
//        border.color:'blue'
//        Column{
//            id:col
//            anchors.fill:parent
//            padding:10
//            spacing:10
//            leftPadding:50
//            topPadding:40
//            Repeater{
//                id:rep
//                model:ListModel{}
//                Button{
//                    text:"name " + index
//                }
//            }
//            move: Transition {
//                NumberAnimation { properties: "x,y"; easing.type: Easing.OutBounce }
//            }
//            add: Transition {
//                NumberAnimation { properties: "x,y"; easing.type: Easing.OutBounce }
//            }
//            populate: Transition {
//                NumberAnimation { properties: "x,y"; from: 200; duration: 100; easing.type: Easing.OutBounce }
//            }
//        }
//    }

//       Rectangle{
//           width:500
//           height:200
//           border.color:'blue'
//           Flow{
//               id:flow
//               anchors.fill:parent
//               padding:10
//               spacing:10
//               leftPadding:50
//               topPadding:40
//               layoutDirection: Qt.RightToLeft // Qt.LeftToRight (default)
//               flow:Flow.TopToBottom // Flow.LeftToRight
//               Repeater{
//                   id:rep
//                   model:ListModel{}
//                   Button{
//                       text:"name " + index
//                   }
//               }
//               move: Transition {
//                   NumberAnimation { properties: "x,y"; easing.type: Easing.OutBounce }
//               }
//               add: Transition {
//                   NumberAnimation { properties: "x,y"; easing.type: Easing.OutBounce }
//               }
//               populate: Transition {
//                   NumberAnimation { properties: "x,y"; from: 200; duration: 100; easing.type: Easing.OutBounce }
//               }
//           }
//       }

    Rectangle{
        width:500
        height:200
        border.color:'blue'
        Column{
            id:col
            anchors.fill:parent
            padding:10
            spacing:10
            leftPadding:50
            topPadding:40
            Repeater{
                id:rep1
                model:ListModel{}
                Button{
                    text:"name " + index
                }
            }
            move: Transition {
                NumberAnimation { properties: "x,y"; easing.type: Easing.OutBounce }
            }
            add: Transition {
                NumberAnimation { properties: "x,y"; easing.type: Easing.OutBounce }
            }
            populate: Transition {
                NumberAnimation { properties: "x,y"; from: 200; duration: 100; easing.type: Easing.OutBounce }
            }
        }
    }

    Row{
        spacing:20
        anchors.bottomMargin: 5
        Button{
            anchors.bottom:parent.bottom
            text:"右键清除"
            MouseArea{
                anchors.fill: parent;
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked:{

                    if (mouse.button === Qt.RightButton) {
                        rep.model.clear()
                    }else{
                        rep.model.append({"name":rep.model.count})
                    }
                }
            }
        }

        Button{
            anchors.bottom:parent.bottom
            text:"右键清除"
            MouseArea{
                anchors.fill: parent;
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked:{

                    if (mouse.button === Qt.RightButton) {
                        rep1.model.clear()
                    }else{
                        rep1.model.append({"name":rep1.model.count})
                    }
                }
            }
        }
    }
   }
}
