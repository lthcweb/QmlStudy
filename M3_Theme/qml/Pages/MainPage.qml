import QtQuick 2.15
import QtQuick.Controls 2.15

SwipeView {
    id: mainPage
    anchors.fill: parent
    width: parent.width
    currentIndex: 2

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
