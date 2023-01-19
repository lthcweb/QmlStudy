import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 336
    height: 725
    visible: true
    title: qsTr("M3_Theme")

    flags: Qt.WindowStaysOnTopHint

    Loader{
        id: mainLoader
        anchors.fill: parent

        source: "./MainWindow.qml"

        function reload(){
            mainLoader.source = "";
            QmlEngine.clearCache();
            mainLoader.source = "./MainWindow.qml"
        }
    }

    Connections{
        target: QmlEngine

        function onReloadUI(){
            console.log("Reloading UI");
            mainLoader.reload();
        }
    }
}
