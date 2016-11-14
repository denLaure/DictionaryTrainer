import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import "../../../actions"
import "../../../store"

Item {
    anchors.top: parent.top
    width: parent.width
    height: 56 * dp
    ToolBar {
        anchors.fill: parent
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
            text: qsTr("Question ") + TestStore.questionNumber
            font.pixelSize: 20 * dp
            font.weight: Font.Medium
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 56 * dp
            }
        }
    }
}
