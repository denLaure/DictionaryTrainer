import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import "../../../actions"

Item {
    property string buttonText: ""

    Layout.preferredWidth: parent.width - 32 * dp
    height: 56 * dp
    anchors {
        left: parent.left
        leftMargin: 16 * dp
    }

    Button {
        text: buttonText
        anchors.fill: parent
        onClicked: {
            AppActions.submitAnswer(buttonText);
        }
    }
}
