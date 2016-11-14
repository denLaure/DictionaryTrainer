import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import "../../../actions"
import "../../../store"
import "../components"

AndroidPage {

    ToolBar {
        id: bar
        anchors.top: parent.top
        width: parent.width
        height: 56 * dp
        Button {
            height: 48 * dp
            width: 48 * dp
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 16 * dp
            }
            background: Image {
                height: 24 * dp
                width: 24 * dp
                anchors.verticalCenter: parent.verticalCenter
                source: Qt.resolvedUrl("qrc:/icons/icons/ic_arrow_back_white_24dp.png")
            }
            onClicked: {
                AppActions.popPage();
            }
        }

        Label {
            text: "Dictionary trainer"
            font.pixelSize: 20 * dp
            font.weight: Font.Medium
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 56 * dp
            }
        }
    }

    Flickable {
        anchors.top: bar.bottom
        anchors.topMargin: 8 * dp
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8 * dp
        contentHeight: card.height
        width: parent.width
        clip: true
        boundsBehavior: Flickable.StopAtBounds

        MaterialCard {
            id: card
            height: column.height

            Column {
                id: column
                width: parent.width
                topPadding: 24 * dp
                bottomPadding: 40 * dp

                Label {
                    id: title
                    width: parent.width - 32 * dp
                    height: contentHeight
                    text: TermInformationStore.term
                    font.pixelSize: 36 * dp
                    wrapMode: Text.Wrap
                    anchors {
                        left: parent.left
                        leftMargin: 16 * dp
                        rightMargin: 16 * dp
                    }
                }

                Label {
                    id: subtitle
                    width: parent.width - 32 * dp
                    height: contentHeight
                    text: TermInformationStore.transcriptionTerm
                    color: "#9E9E9E"
                    font.pixelSize: 20 * dp
                    wrapMode: Text.Wrap
                    anchors {
                        left: parent.left
                        leftMargin: 16 * dp
                        rightMargin: 16 * dp
                    }
                }

                Label {
                    width: parent.width - 32 * dp
                    height: contentHeight
                    text: TermInformationStore.definition
                    font.pixelSize: 20 * dp
                    font.weight: Font.Medium
                    wrapMode: Text.WordWrap
                    anchors {
                        left: parent.left
                        leftMargin: 16 * dp
                        rightMargin: 16 * dp
                    }
                    topPadding: 16 * dp
                }

                Label {
                    width: parent.width - 32 * dp
                    height: contentHeight
                    text: "\"" + TermInformationStore.context + "\""
                    font.pixelSize: 20 * dp
                    wrapMode: Text.WordWrap
                    anchors {
                        left: parent.left
                        leftMargin: 16 * dp
                        rightMargin: 16 * dp
                    }
                    topPadding: 16 * dp
                }
            }
        }
    }
}
