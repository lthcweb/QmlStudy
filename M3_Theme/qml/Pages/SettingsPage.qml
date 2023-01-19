import QtQuick 2.15
import QtQuick.Controls 2.15

import MTheme 1.0 as M
import "../"

Page {

    Column{
        Switch{
            id:switcher
            text: position < 0.5 ? "浅色模式" : "深色模式"
            position:Global.themeMode===0? 0 : 1
            onToggled:{
                setColorMode()
            }
            Component.onCompleted: {
                setColorMode()
            }

            function setColorMode(){
                Global.themeMode = position===0 ? 0:1
                M.Colors.currentTheme = position===0 ? M.Colors.themes.light : M.Colors.themes.dark

            }
        }

        Row{
            RadioButton { text: qsTr("Small") }
            RadioButton { text: qsTr("Medium");  checked: true }
            RadioButton { text: qsTr("Large") }
        }
    }

}
