import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.dictionary.trainer.QuickFlux 1.0
import "../../../actions"
import "../../../store"

Page {

    PageHeader {
        id: header
        title: "Dictionary trainer"
    }

    Label {
        id: label
        anchors.top: header.bottom
        width: parent.width
        wrapMode: Text.Wrap
        verticalAlignment: Text.AlignVCenter
        text: qsTr("Chose dictionary")
        x: Theme.horizontalPageMargin
    }

    SilicaListView {
        id: view
        model: TermInformationStore.dictionaries
        width: parent.width
        spacing: Theme.paddingSmall
        anchors.top: label.bottom
        height: parent.height

        delegate: BackgroundItem {
            width: parent.width
            Label {
                width: parent.width
                wrapMode: Text.Wrap
                verticalAlignment: Text.AlignVCenter
                text: model.name
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
                anchors.verticalCenter: parent.verticalCenter
                x: Theme.horizontalPageMargin
            }
            onClicked: {
                AppActions.askToChangeDictionary(index);
            }
        }
    }
}

