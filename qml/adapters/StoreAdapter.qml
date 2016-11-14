import QtQuick 2.0
import "../store"

Item {

    Component.onCompleted: {
        TestStore.waitFor = [TermInformationStore.listenerId];
    }

}

