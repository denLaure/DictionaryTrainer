import QtQuick 2.0
import harbour.dictionary.trainer.QuickFlux 1.0
import Sailfish.Silica 1.0
import "../../../actions"
import "../../../store"

Page {

    SilicaFlickable {
        id: flickable
        contentHeight: column.height
        anchors.fill: parent

        VerticalScrollDecorator {}

        Column {
            id: column
            spacing: Theme.paddingLarge
            width: parent.width

            PageHeader {}

            Label {
                text: TermInformationStore.fullName
                font.pixelSize: Theme.fontSizeExtraLarge
                wrapMode: Text.Wrap
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
            }

            Label {
                text: "- " + TermInformationStore.definition
                font.pixelSize: Theme.fontSizeMedium
                wrapMode: Text.Wrap
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
            }

            Label {
                text: TermInformationStore.context
                font.pixelSize: Theme.fontSizeMedium
                wrapMode: Text.Wrap
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
            }
         }
     }
}
