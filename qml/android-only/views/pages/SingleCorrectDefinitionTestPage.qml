import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.1
import "../../../actions"
import "../../../store"
import "../components"

AndroidPage {

    TestPageToolBar {
        id: bar
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

            Label {
                Layout.preferredWidth: parent.width - 32 * dp
                Layout.preferredHeight: contentHeight
                text: TestStore.question
                font.pixelSize: 45 * dp
                wrapMode: Text.Wrap
                anchors {
                    left: parent.left
                    leftMargin: 16 * dp
                    rightMargin: 16 * dp
                }
            }

            Rectangle {
                Layout.leftMargin: 16 * dp
                Layout.preferredWidth: parent.width - 32 * dp
                Layout.preferredHeight: 1 * dp
                color: "#DBDBDB"
            }

            AnswerComponent {
                labelText: TestStore.options[0]
            }

            AnswerComponent {
                labelText: TestStore.options[1]
            }

            AnswerComponent {
                labelText: TestStore.options[2]
            }

            AnswerComponent {
                labelText: TestStore.options[3]
            }

            Button {
                Layout.preferredWidth:  parent.width - 32 * dp
                text: qsTr("Skip question")
                font.weight: Font.Medium
                anchors {
                    left: parent.left
                    leftMargin: 16 * dp
                }
                onClicked: {
                    AppActions.skipQuestion();
                }
            }
        }
    }
}
