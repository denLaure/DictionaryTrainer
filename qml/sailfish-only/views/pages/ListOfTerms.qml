import QtQuick 2.2
import Sailfish.Silica 1.0
import harbour.dictionary.trainer.QuickFlux 1.0
import "../../../actions"
import "../../../store"

Page {

    SilicaListView {
        id: listView
        header: PageHeader { title: qsTr("List of terms") }
        anchors.fill: parent
        model: TermInformationStore.list
        spacing: Theme.paddingSmall
        delegate: BackgroundItem {
            width: listView.width

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
                AppActions.askToShowInformation(index);
            }
        }

        VerticalScrollDecorator { flickable: parent }
    }
}
