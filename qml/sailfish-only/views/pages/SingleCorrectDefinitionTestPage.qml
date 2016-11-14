import QtQuick 2.2
import Sailfish.Silica 1.0
import harbour.dictionary.trainer.QuickFlux 1.0
import "../../../actions"
import "../../../store"
import "../components"

Page {
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + Theme.paddingLarge

        VerticalScrollDecorator {}

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingLarge

            PageHeader { title: qsTr("Question ") + TestStore.questionNumber }

            Label {
                text: TestStore.question
                font.pixelSize: Theme.fontSizeExtraLarge
                wrapMode: Text.Wrap
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
               }
            }

            AnswerComponent {
                labelText: TestStore.options[0]
                anchors {
                    left: parent.left
                    right: parent.right
                }
            }

             AnswerComponent {
                labelText: TestStore.options[1]
                anchors {
                    left: parent.left
                    right: parent.right
                }
            }

             AnswerComponent {
                labelText: TestStore.options[2]
                anchors {
                    left: parent.left
                    right: parent.right
                }
            }

             AnswerComponent {
                labelText: TestStore.options[3]
                anchors {
                    left: parent.left
                    right: parent.right
                }
            }

            Button {
                height: Theme.itemSizeLarge
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: qsTr("Skip question")
                onClicked: {
                    AppActions.skipQuestion();
                }
            }
        }
    }
}
