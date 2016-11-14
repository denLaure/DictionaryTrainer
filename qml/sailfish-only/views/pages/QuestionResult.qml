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
            PageHeader {
                id: header
                title: qsTr("Question ") + TestStore.questionNumber
            }

            Loader {
                width: parent.width
                height: parent.parent.parent.height / 20
                sourceComponent: (TestStore.result === "correct") ? correct : ((TestStore.result === "wrong") ? wrong : skipped);
            }

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

            Button {
                height: Theme.itemSizeLarge
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
                text: qsTr("Next question")
                onClicked: {
                    AppActions.goToNextQuestion();
                }
            }
         }
     }

    Component {
        id: wrong
        Rectangle {
            color: "#60FFCCCF"
            Image {
                source: "image://theme/icon-cover-cancel"
                verticalAlignment: Image.AlignVCenter
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: parent.width / 22.5
                }
            }
            Text {
                text: qsTr("Wrong")
                color: "#8C1424"
                font.pixelSize: Theme.fontSizeMedium
                font.weight: Font.Normal
                anchors {
                    verticalCenter: parent.Center
                    left: parent.left
                    leftMargin: parent.width / 6
                }
            }
        }
    }

    Component {
        id: correct
        Rectangle {
            color: "#60B4E8BB"
            Image {
                source: "image://theme/icon-s-installed"
                verticalAlignment: Image.AlignVCenter
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: parent.width / 22.5
                }
            }
            Text {
                text: qsTr("Correct")
                color: "#00A553"
                font.pixelSize: Theme.fontSizeMedium
                font.weight: Font.Normal
                anchors {
                    verticalCenter: parent.Center
                    left: parent.left
                    leftMargin: parent.width / 6
                }
            }
        }
    }

    Component {
        id: skipped
        Rectangle {
            color: "#60F0EFEC"
            Image {
                source: "image://theme/icon-s-high-importance"
                verticalAlignment: Image.AlignVCenter
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: parent.width / 22.5
                }
            }
            Text {
                text: qsTr("Skipped")
                color: "#1A1A1A"
                font.pixelSize: Theme.fontSizeMedium
                font.weight: Font.Normal
                anchors {
                    verticalCenter: parent.Center
                    left: parent.left
                    leftMargin: parent.width / 6
                }
            }
        }
    }
}
