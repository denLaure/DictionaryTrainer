pragma Singleton
import QtQuick 2.0
import harbour.dictionary.trainer.QuickFlux 1.0
import QtQuick.XmlListModel 2.0
import harbour.dictionary.trainer.settings 1.0
import "../actions"
import "./"

AppListener {

    property int progress

    property int learnedWords

    property string question

    property string rightAnswer

    property string alternativeRightAnswer

    property var openAnswer

    property var options: []

    property var questions

    property int questionIndex

    property int questionNumber

    property string result

    property XmlListModel dictionary: TermInformationStore.list

    Settings {
        id: data
    }

    function fillProgress() {
        progress = 0;
        learnedWords = 0;
        if(data.childGroups().indexOf("dictionary") !== -1) {
            for (var i = 0; i < dictionary.count; i++){
                progress += data.valueAsInt("dictionary/" + i.toString());
            }
            learnedWords = data.value("dictionary/learnedWords", 0);
        } else {
            for (var i = 0; i < dictionary.count; i++){
                data.setValue("dictionary/" + i.toString(), 0);
            }
            data.setValue("dictionary/learnedWords", 0)
        }
    }

    function updateDictionaryProgress(index) {
        var currentStatus = data.valueAsInt("dictionary/" + index);
        var newStatus;
        if (result === "correct") {
            newStatus = getWordStatus(currentStatus + 1);
        } else {
            newStatus = getWordStatus(currentStatus - 2);
        }
        var statusChange = newStatus - currentStatus
        calculateLearnedWords(currentStatus, newStatus);
        progress += statusChange;
        data.setValue("dictionary/" + index.toString(), newStatus);
    }

    function getWordStatus(wordStatus){
        if (wordStatus < 0) {
            wordStatus = 0
        } else if (wordStatus >= 3) {
            wordStatus = 3
        }
        return wordStatus;
    }

    function calculateLearnedWords(currentStatus, newStatus){
        if (currentStatus < 3 && newStatus === 3) {
            learnedWords += 1;
            data.setValue("dictionary/learnedWords", learnedWords);
        } else if (currentStatus === 3 && newStatus < 3){
            learnedWords -= 1;
            data.setValue("dictionary/learnedWords", learnedWords);
        }
    }

    function makeQuestion(index, type) {
        options = [];
        var element = dictionary.get(index);
        question = (type === 0) ? element.name : element.description;
        questionIndex = index;
        rightAnswer = (type === 0) ? element.description : element.name;
        alternativeRightAnswer = (element.synonym !== "") ? element.synonym : element.name;
        if(type !== 2) {
            var rightVariantNumber = Math.floor(Math.random() * 4);
            for(var i = 0; i < 4; i++) {
                if(i !== rightVariantNumber) {
                    options.push(getWrongOption(index, type));
                } else {
                    options.push((type === 0) ? element.description : element.name);
                }
            }
        }
    }

    function getWrongOption(index, type) {
        while(1) {
            var rand = Math.floor(Math.random() * dictionary.count);
            var element = dictionary.get(rand);
            var randomVariant = (type === 0) ? element.description : element.name;
            if(options.indexOf(randomVariant) === -1 && rand !== index) {
                return randomVariant;
            }
        }
    }

    function fillQuestions() {
        questions = [];
        questionNumber = 0;
        while(questions.length < 20) {
            var rand = Math.floor(Math.random() * dictionary.count);
            if(questions.indexOf(rand) === -1) {
                questions.push(rand);
            }
        }
    }

    function fillQuestionsLessStudiedWords() {
        questions = [];
        questionNumber = 0;
        var arrayLessStudiedWords = getLessStudiedWords();
        while(questions.length < getCountOfQuestions()){
            var rand = Math.floor(Math.random() * arrayLessStudiedWords.length);
            var index = arrayLessStudiedWords[rand];
            if(questions.indexOf(index) === -1) {
                questions.push(index);
            }
        }
    }

    function getLessStudiedWords(){
        var arrayLessStudiedWords = [];
        for (var i = 0; i < dictionary.count; i++) {
            if(data.valueAsInt("dictionary/" + i.toString()) < 3){
                arrayLessStudiedWords.push(i);
            }
        }
        return arrayLessStudiedWords;
    }

    function getCountOfQuestions(){
        var countLessStudiedWords = dictionary.count - learnedWords;
        if (countLessStudiedWords < 20) { return countLessStudiedWords }
        return 20;
    }

    function isEnoughLessStudiedWords(){
        if (learnedWords === dictionary.count) { return false }
        return true;
    }

    function nextQuestion(type) {
        questionNumber += 1;
        makeQuestion(questions.pop(), type);
    }

    function checkResult(answer) {
        if(rightAnswer === answer || alternativeRightAnswer === answer) {
            result = "correct";
        } else {
            result = "wrong";
        }
    }

    function setSkipped() {
        result = "skipped";
    }

}
