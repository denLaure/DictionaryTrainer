import QtQuick 2.0
import harbour.dictionary.trainer.QuickFlux 1.0
import Sailfish.Silica 1.0
import "../../../actions"
import "../../../store"



Item {

    property string labelText: ""

    id: item
    height: column.height + Theme.paddingLarge

    Column {
        id: column
        width: parent.width
        spacing: Theme.paddingLarge

        Label {
            id: label
            text: labelText
            font.pixelSize: Theme.fontSizeMedium
            wrapMode: Text.Wrap
            anchors {
                left: parent.left
                right: parent.right
                margins: Theme.paddingLarge
            }
        }

        Button {
            id: button
            height: Theme.itemSizeLarge
            text: qsTr("Choose")
            anchors {
                left: parent.left
                right: parent.right
                margins: Theme.paddingLarge
            }
            onClicked: {
                AppActions.submitAnswer(label.text);
            }
        }

        Rectangle {
            anchors {
                margins: Theme.paddingLarge
            }
            width: parent.width
            height: 1
            color: "black"
            border.color: "black"
        }
    }

}
