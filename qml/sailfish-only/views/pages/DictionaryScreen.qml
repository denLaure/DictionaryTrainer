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
            anchors.margins: Theme.paddingLarge
            width: parent.width
            PageHeader {
                id: header
                title: qsTr("Dictionary Trainer")
            }

            Button {
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: qsTr("Test all words")
                onClicked: {
                    AppActions.askToStartFullTest();
                }
            }

            Button {
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: qsTr("Test less studied words")
                onClicked: {
                    AppActions.askToStartTestLessStudiedWords();
                }
            }

            Button {
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: qsTr("Wordlist")
                onClicked: {
                    AppActions.navigateTo("ListOfTerms.qml");
                }
            }

            /*Button {
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: qsTr("Change dictionary")
                onClicked: {
                    pageStack.replaceAbove(pageStack.previousPage(), Qt.resolvedUrl("DictionarySelectionScreen.qml"));
                }
            }*/

            ProgressBar {
                width: parent.width
                maximumValue: TestStore.dictionary.count * 3
                Label {
                    text: ((TestStore.progress / (TestStore.dictionary.count * 3)) * 100).toFixed(0) + "%"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                value: TestStore.progress
                label: qsTr("Words learned") + " " + TestStore.learnedWords + " " +
                       qsTr("out of") + " " + TestStore.dictionary.count
            }
        }
    }
}
