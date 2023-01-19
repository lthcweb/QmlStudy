import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Templates 2.15 as T
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.Material.impl 2.12
import Qt.labs.settings 1.1
import MTheme 1.0 as M
import "."
import "./Pages"
import "./Components"


Page {
    id:mainPage
    Material.theme: Global.themeMode
    Material.background: Global.primary
    Material.foreground: Global.quaternary
    Material.accent: Global.tertiary
    anchors.fill: parent

    header: Label {
        text: "Header"
        horizontalAlignment: Text.AlignHCenter
    }

    footer:NavigationBar{
        id:navigationBar
    }

    SwipeView {
        id: view
        anchors.fill: parent
        width: parent.width
        currentIndex: navigationBar.currentIndex

        MediaPage{

        }
        PlayListPage{

        }

        PlayPage{

        }
        DownloadPage{

        }

        SettingsPage{
            id:settingsPage

        }

    }

//Rectangle {
////    color:'grey'


//    Column{
//        spacing:20


//        MButton{
//            text:"Button1"

//        }

//        Repeater{
//            model:1
//            delegate:Button{

//            }
//        }

//        Button{
////            text: "<font color='#FF9494'> Light </font>"  //改变文本颜色
//            text: "Light"
//            onClicked:{
//                settings.themeMode = Material.Light
//                settings.themeMode = Material.Light
////                myRectangle.themeMode = Material.Light
//                console.log(Global.settingsFileName)
//                console.log(Material.Theme)
////                console.log(test.fileName)
////                console.log(T.Colors.primary)
//            }
////            Material.background:Material.Theme //"#1E2022"    //改变背景颜色
//           Material.background:"#1EFFFFFF"    //改变背景颜色
//           Material.foreground: Material.Theme

//        }
//        Button{
//            text: 'Dark'
//            onClicked:{
//                settings.themeMode = Material.Dark
////                myRectangle.themeMode = Material.Dark
//                settings.themeMode = Material.Dark
//                console.log(Material.Theme)
//            }
//        }

//        CheckBox{
//            text:'CheckBox'
//        }

//        MyRectangle{
//            id:myRectangle


//       }


//   }


//}
}

