import QtQuick 2.0
import Sailfish.Silica 1.0
import "views/pages"
import "../store/"
import "../scripts/"
import "../adapters/"
import "../actions/"

ApplicationWindow
{
    initialPage: Component{ DictionaryScreen { } }
    cover: Qt.resolvedUrl("views/cover/CoverPage.qml")
    allowedOrientations: Orientation.All
    _defaultPageOrientations: Orientation.All

    /*Component.onCompleted: {
        AppActions.setInitialPage();
    }*/

    PageOpenerScript {

    }

    StoreAdapter {

    }

}
