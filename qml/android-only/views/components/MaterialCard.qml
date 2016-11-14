import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Rectangle {
    width: parent.width - 16 * dp
    radius: 2 * dp
    anchors {
        left: parent.left
        leftMargin: 8 * dp
    }
    layer.enabled: true
    layer.effect: DropShadow {
        color: "#9E9E9E"
        radius: 20
        samples: 25
        verticalOffset: 2 * dp
        transparentBorder: true
    }
}

