import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import "../../../actions"
import "../../../store"

Item {

    property string labelText: ""

    height: column.height
    width: parent.width - 32 * dp
    anchors {
        left: parent.left
        leftMargin: 16 * dp
    }

    Column {
        id: column
        width: parent.width

        Label {
            id: label
            text: labelText
            width: parent.width
            height: contentHeight
            wrapMode: Text.WordWrap
            anchors {
                left: parent.left
            }
        }

        Button {
            width: parent.width
            text: qsTr("Choose")
            font.weight: Font.Medium
            anchors {
                left: parent.left
            }
            onClicked: {
                AppActions.submitAnswer(label.text);
            }
        }

        Rectangle {
            width: parent.width
            height: 1
            color: "#DBDBDB"
            border.color: "#DBDBDB"
        }
    }
}
