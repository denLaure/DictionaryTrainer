import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Window 2.2
import "views/components/"
import "views/pages/"
import "../scripts"
import "../adapters"

Window {
    id: mainWindow
    title: qsTr("Dictionary trainer")
    visible: true

    StackView {
        anchors.fill: parent
    }

    PageOpenerScript {

    }

    StoreAdapter {

    }
}
