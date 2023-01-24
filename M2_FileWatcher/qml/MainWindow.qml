import QtQuick 2.15
import QtQuick.Controls 2.15

Page {

    Column{
        spacing:10
        Repeater{
        model:5
        delegate:Button{
            text:"Button "+ index
        }
        }
    }

}
