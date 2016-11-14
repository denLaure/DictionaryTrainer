/*
  AppActions is an action creator, a helper component to create
 and dispatch actions via the central dispatcher.
 */
pragma Singleton
import QtQuick 2.0
import harbour.dictionary.trainer.QuickFlux 1.0
import "./"

ActionCreator {

    //Ask to open window with information about term
    signal askToShowInformation(int index)

    //Open window with given url
    signal navigateTo(string url)

    signal replacePage(string url)

    signal popPage()

    signal stackViewPush(string url)

    signal stackViewPop()

    signal stackViewReplace(string url)

    //Ask to start test
    signal askToStartFullTest()

    //Open window with new question
    signal goToNextQuestion()

    //Submit chosen answer
    signal submitAnswer(string answer)

    //Skip question
    signal skipQuestion()

    //Ask to start test with less studied words
    signal askToStartTestLessStudiedWords()

    //Ask to set/change current dictionary
    signal askToChangeDictionary(int index)

    //Check if dictionary was chosen and set initial page according to it
    signal setInitialPage()

    //Send signal when XmlListModel ready
    signal signalModelLoaded()

}
