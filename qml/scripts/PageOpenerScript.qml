import QtQuick 2.0
import harbour.dictionary.trainer.QuickFlux 1.0
import "../actions"
import "../store"

Item {

    AppScript {
        runWhen: ActionTypes.askToShowInformation

        script: {
            AppActions.navigateTo("InfoAboutTerm.qml");
            TermInformationStore.updateInfo(message.index);
        }
    }

    AppScript {
        runWhen: ActionTypes.askToStartFullTest

        script: {
            TestStore.fillQuestions();
            var type = Math.floor(Math.random() * 3);
            TestStore.nextQuestion(type);
            if (type === 0) {
                AppActions.navigateTo("SingleCorrectDefinitionTestPage.qml");
            } else if (type === 1) {
                AppActions.navigateTo("SingleCorrectTermTestPage.qml");
            } else if (type === 2) {
                AppActions.navigateTo("OpenAnswerTestPage.qml");
            }
        }
    }

    AppScript {
        runWhen: ActionTypes.askToStartTestLessStudiedWords

        script: {
            if (TestStore.isEnoughLessStudiedWords()) {
                TestStore.fillQuestionsLessStudiedWords();
                var type = Math.floor(Math.random() * 3);
                TestStore.nextQuestion(type);
                if (type === 0) {
                    AppActions.navigateTo("SingleCorrectDefinitionTestPage.qml");
                } else if (type === 1) {
                    AppActions.navigateTo("SingleCorrectTermTestPage.qml");
                } else if (type === 2) {
                    AppActions.navigateTo("OpenAnswerTestPage.qml");
                }
            }
        }
    }

    AppScript {
        runWhen: ActionTypes.goToNextQuestion

        script: {
            if(TestStore.questions.length > 0) {
                var type = Math.floor(Math.random() * 3);
                TestStore.nextQuestion(type);
                if (type === 0) {
                    AppActions.replacePage("SingleCorrectDefinitionTestPage.qml");
                } else if (type === 1) {
                    AppActions.replacePage("SingleCorrectTermTestPage.qml");
                } else if (type === 2) {
                    AppActions.replacePage("OpenAnswerTestPage.qml");
                }
            } else {
                AppActions.popPage();
            }
        }
    }

    AppScript {
        runWhen: ActionTypes.submitAnswer

        script: {
            TestStore.checkResult(message.answer);
            TestStore.updateDictionaryProgress(TestStore.questionIndex);
            TermInformationStore.updateInfo(TestStore.questionIndex);
            AppActions.replacePage("QuestionResult.qml");
        }
    }

    AppScript {
        runWhen: ActionTypes.skipQuestion

        script: {
            TestStore.setSkipped();
            TestStore.updateDictionaryProgress(TestStore.questionIndex);
            TermInformationStore.updateInfo(TestStore.questionIndex);
            AppActions.replacePage("QuestionResult.qml");
        }
    }

    AppScript {
        runWhen: ActionTypes.askToChangeDictionary

        script: {
            TermInformationStore.rewritePath(message.index);
            TermInformationStore.loadXmlListModel();
            AppActions.replacePage("DictionaryScreen.qml");
        }
    }

    AppScript {
        runWhen: ActionTypes.setInitialPage

        script: {
            (TermInformationStore.readPath() === "") ?
                        AppActions.navigateTo("DictionarySelectionScreen.qml"):
                        AppActions.navigateTo("DictionaryScreen.qml");
        }
    }

    AppScript {
        runWhen: ActionTypes.signalModelLoaded

        script: {
            TestStore.fillProgress();
        }
    }

    AppListener {
        filter: ActionTypes.navigateTo

        onDispatched: {
            if(Qt.platform.os === "linux") {
                pageStack.push(Qt.resolvedUrl("../sailfish-only/views/pages/" + message.url));
            } else if(Qt.platform.os === "android") {
                AppActions.stackViewPush("../pages/" + message.url);
            }
        }
    }

    AppListener {
        filter: ActionTypes.replacePage

        onDispatched: {
            if(Qt.platform.os === "linux") {
                pageStack.replaceAbove(pageStack.previousPage(), Qt.resolvedUrl("../sailfish-only/views/pages/" + message.url));
            } else if(Qt.platform.os === "android") {
                AppActions.stackViewReplace("../pages/" + message.url);
            }
        }
    }

    AppListener {
        filter: ActionTypes.popPage

        onDispatched: {
            if(Qt.platform.os === "linux") {
                pageStack.pop();
            } else if(Qt.platform.os === "android") {
                AppActions.stackViewPop();
            }
        }
    }

}

