import QtQuick 2.15
import Qt.labs.settings 1.1

import MTheme 1.0 as M

pragma Singleton
QtObject {
    id:global
    readonly property string settingsFileName: "settings.ini"

    property alias themeMode: settings.themeMode


    readonly property string primary: M.Colors.primary
    readonly property string secondary: M.Colors.secondary
    readonly property string tertiary: M.Colors.tertiary
    readonly property string quaternary: M.Colors.quaternary

    property var settings: Settings {
        id:settings
        category: "Theme"
        fileName: global.settingsFileName

        property int themeMode:0
    }

}


