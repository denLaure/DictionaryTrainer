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
            text: qsTr("List of terms")
            font.pixelSize: 20 * dp
            font.weight: Font.Medium
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 56 * dp
            }
        }
    }

    ListView {
        width: parent.width
        anchors.top: bar.bottom
        anchors.topMargin:  8 * dp
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8 * dp
        clip: true
        boundsBehavior: Flickable.StopAtBounds
        model: TermInformationStore.list
        delegate: Rectangle {
            width: parent.width
            height: 48 * dp
            color: mouseArea.pressed ? "#CCCCCC" :
                                       "#" + (parseInt("FAFAFA", 16) - parseInt("111111", 16) * (index % 2)).toString(16)
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                Label {
                    text: model.name
                    font.pixelSize: 16 * dp
                    anchors {
                        left: parent.left
                        leftMargin: 16 * dp
                        verticalCenter: parent.verticalCenter
                    }
                }
                onClicked: {
                    AppActions.askToShowInformation(index);
                }
            }
        }
    }
}
