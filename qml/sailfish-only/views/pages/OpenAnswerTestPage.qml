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

            TextField {
                id: answer
                width: parent.width
                placeholderText: qsTr("Enter your answer")
                EnterKey.onClicked: {
                    parent.focus = true;
                }
            }

            Button {
                height: Theme.itemSizeLarge
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: qsTr("Accept")
                onClicked: {
                    AppActions.submitAnswer(answer.text);
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
