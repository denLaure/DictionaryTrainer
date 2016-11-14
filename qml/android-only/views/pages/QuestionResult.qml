import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
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
        contentHeight: card.height + continueButton.height + 24 * dp
        width: parent.width
        clip: true
        boundsBehavior: Flickable.StopAtBounds

        MaterialCard {
            id: card
            height: result.height + column.height

            Loader {
                id: result
                width: parent.width
                height: 56 * dp
                sourceComponent: (TestStore.result === "correct") ?
                                     correctAnswerSign : ((TestStore.result === "wrong")
                                                          ? wrongAnswerSign : skippedAnswerSign)
            }

            Column {
                id: column
                width: parent.width
                anchors.top: result.bottom
                bottomPadding: 40 * dp
                topPadding: 24 * dp

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

        Button {
            id: continueButton
            width:  parent.width - 32 * dp
            text: qsTr("Next question")
            font.weight: Font.Medium
            anchors {
                top: card.bottom
                left: parent.left
                leftMargin: 16 * dp
                topMargin: 24 * dp
            }
            onClicked: {
                AppActions.goToNextQuestion();
            }
        }
    }

    Component {
        id: wrongAnswerSign

        AnswerSign {
            backgroundColor: "#FFCCCF"
            iconSource: "qrc:/icons/icons/ic_close_black_24dp.png"
            labelText: qsTr("Wrong")
            labelColor: "#8C1424"
        }
    }

    Component {
        id: correctAnswerSign

        AnswerSign {
            backgroundColor: "#B4E8BB"
            iconSource: "qrc:/icons/icons/ic_check_black_24dp.png"
            labelText: qsTr("Correct")
            labelColor: "#00A553"
        }
    }

    Component {
        id: skippedAnswerSign

        AnswerSign {
            backgroundColor: "#CCCCCC"
            iconSource: "qrc:/icons/icons/ic_radio_button_unchecked_black_24dp.png"
            labelText: qsTr("Skipped")
            labelColor: "#1A1A1A"
        }
    }
}
