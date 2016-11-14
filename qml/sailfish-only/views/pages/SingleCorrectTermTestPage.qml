import QtQuick 2.2
import Sailfish.Silica 1.0
import harbour.dictionary.trainer.QuickFlux 1.0
import "../../../actions"
import "../../../store"

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
                font.pixelSize: Theme.fontSizeMedium
                wrapMode: Text.Wrap
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
            }

            Button {
                id: option0
                height: Theme.itemSizeMedium
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: TestStore.options[0]
                onClicked: {
                    AppActions.submitAnswer(option0.text);
                }
            }

            Button {
                id: option1
                height: Theme.itemSizeMedium
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: TestStore.options[1]
                onClicked: {
                    AppActions.submitAnswer(option1.text);
                }
            }

            Button {
                id: option2
                height: Theme.itemSizeMedium
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: TestStore.options[2]
                onClicked: {
                    AppActions.submitAnswer(option2.text);
                }
            }

            Button {
                id: option3
                height: Theme.itemSizeMedium
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: TestStore.options[3]
                onClicked: {
                    AppActions.submitAnswer(option3.text);
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
