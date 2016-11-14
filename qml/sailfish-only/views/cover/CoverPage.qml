import QtQuick 2.0
import harbour.dictionary.trainer.QuickFlux 1.0
import Sailfish.Silica 1.0
import "../../../actions"
import "../../../store"

CoverBackground {
    Label {
        id: dictionaryName
        wrapMode: Text.Wrap
        y: parent.height / 4
        anchors {
            left: parent.left
            right: parent.right
            margins: Theme.paddingLarge
        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("Words learned") + "\n" + TestStore.learnedWords + " " +
              qsTr("out of") + " " + TestStore.dictionary.count
    }

    Label {
        anchors {
            top: dictionaryName.bottom
        }
        width : parent.width
        font.pixelSize: Theme.fontSizeLarge
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: ((TestStore.progress / (TestStore.dictionary.count * 3)) * 100).toFixed(0) + "%"
    }
}
