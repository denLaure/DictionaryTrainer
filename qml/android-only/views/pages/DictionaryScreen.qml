import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.1
import "../../../actions"
import "../../../store"

AndroidPage {

    ToolBar {
        id: bar
        anchors.top: parent.top
        width: parent.width
        height: 56 * dp
        Label {
            text: "Dictionary trainer"
            font.weight: Font.Medium
            font.pixelSize: 20 * dp
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 16 * dp
            }
        }
    }

    Flickable {
        anchors.top: bar.bottom
        anchors.topMargin: 8 * dp
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8 * dp
        contentHeight: column.height
        width: parent.width
        clip: true
        boundsBehavior: Flickable.StopAtBounds

        ColumnLayout {
            id: column
            width: parent.width
            spacing: 10

            Button {
                Layout.preferredWidth: parent.width - 32 * dp
                Layout.preferredHeight: 72 * dp
                text: qsTr("Test all words")
                font.pixelSize: 16 * dp
                anchors {
                    left: parent.left
                    leftMargin: 16 * dp
                }
                onClicked: {
                    AppActions.askToStartFullTest();
                }
            }

            Button {
                Layout.preferredWidth: parent.width - 32 * dp
                Layout.preferredHeight: 72 * dp
                text: qsTr("Test less studied words")
                font.pixelSize: 16 * dp
                anchors {
                    left: parent.left
                    leftMargin: 16 * dp
                }
                onClicked: {
                    AppActions.askToStartTestLessStudiedWords();
                }
            }

            Button {
                Layout.preferredWidth: parent.width - 32 * dp
                Layout.preferredHeight: 72 * dp
                text: qsTr("Wordlist")
                font.pixelSize: 16 * dp
                anchors {
                    left: parent.left
                    leftMargin: 16 * dp
                }
                onClicked: {
                    AppActions.navigateTo("ListOfTerms.qml");
                }
            }

            Rectangle {
                Layout.leftMargin: 24 * dp
                Layout.preferredWidth: parent.width - 48 * dp
                Layout.preferredHeight: 1 * dp
                color: "#DBDBDB"
            }

            Label {
                text: ((TestStore.progress / (TestStore.dictionary.count * 3)) * 100).toFixed(0) + "%"
                font.pixelSize: 16 * dp
                anchors.horizontalCenter: parent.horizontalCenter
            }

            ProgressBar {
                Layout.preferredWidth: parent.width - 48 * dp
                value: TestStore.progress / (TestStore.dictionary.count * 3)
                anchors {
                    left: parent.left
                    leftMargin: 24 * dp
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Label {
                text: qsTr("Words learned") + " " + TestStore.learnedWords + " " +
                      qsTr("out of") + " " + TestStore.dictionary.count
                font.pixelSize: 16 * dp
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
