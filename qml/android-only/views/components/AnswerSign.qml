import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

Item {
    property string backgroundColor

    property string iconSource

    property string labelText

    property string labelColor

    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        color: backgroundColor

        Image {
            height: 24 * dp
            width: 24 * dp
            source: iconSource
            verticalAlignment: Image.AlignVCenter
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 16 * dp
            }
        }

        Label {
            text: labelText
            color: labelColor
            font.pixelSize: 20 * dp
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin:72 * dp
            }
        }
    }
}
