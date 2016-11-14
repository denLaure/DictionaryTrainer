import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import harbour.dictionary.trainer.QuickFlux 1.0
import "../../../actions"
import "../pages"

Item {
    focus: true

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Component { DictionaryScreen {} }
    }

    AppListener {
        filter: ActionTypes.stackViewPush
        onDispatched: {
            stackView.push(Qt.resolvedUrl(message.url));
        }
    }

    AppListener {
        filter: ActionTypes.stackViewPop
        onDispatched: {
            stackView.pop();
        }
    }

    AppListener {
        filter: ActionTypes.stackViewReplace
        onDispatched: {
            stackView.replace(stackView.currentItem, Qt.resolvedUrl(message.url));
        }
    }

    Keys.onReleased: {
        if(event.key === Qt.Key_Back) {
            if(stackView.depth > 1) {
                event.accepted = true;
                stackView.pop();
            }
        }
    }
}
