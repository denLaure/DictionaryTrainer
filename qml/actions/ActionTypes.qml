/*
  ActionTypes is a constant table to store all the available
 action types in an application.
 */
pragma Singleton
import QtQuick 2.0
import harbour.dictionary.trainer.QuickFlux 1.0

KeyTable {
    id: actionTypes;

    property string askToShowInformation

    property string navigateTo

    property string replacePage

    property string popPage

    property string stackViewPush

    property string stackViewPop

    property string stackViewReplace

    property string askToStartFullTest

    property string goToNextQuestion

    property string submitAnswer

    property string skipQuestion

    property string askToStartTestLessStudiedWords

    property string askToChangeDictionary

    property string setInitialPage

    property string signalModelLoaded

}
