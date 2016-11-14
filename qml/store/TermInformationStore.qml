pragma Singleton
import QtQuick 2.0
import harbour.dictionary.trainer.QuickFlux 1.0
import QtQuick.XmlListModel 2.0
import harbour.dictionary.trainer.settings 1.0
import "../actions"

AppListener {

    property string term

    property string transcriptionTerm

    property string definition

    property string context

    property string synonym

    property string transcriptionSynonym

    property alias list: dictionary

    property string fullName

    property string dictionaryPath

    Settings {
        id: settings
    }

    XmlListModel {
        id: dictionary
        source: "qrc:/dictionaries/data/0-dictionary-terms.xml"
        query: "/dictionary/term"
        XmlRole {name: "name"; query: "name/text/string()" }
        XmlRole {name: "transcriptionName"; query: "name/transcription/string()" }
        XmlRole {name: "synonym"; query: "synonym/text/string()" }
        XmlRole {name: "transcriptionSynonym"; query: "synonym/transcription/string()" }
        XmlRole {name: "context"; query: "context/string()" }
        XmlRole {name: "description"; query: "description/string()"}

        onStatusChanged: {
            if(status === XmlListModel.Ready) {
                AppActions.signalModelLoaded();
            }
        }
    }

    /*property ListModel dictionaries: ListModel {
        id: dictionaryModel

        ListElement {
            name: "dictionary 0"
            source: "qrc:/dictionaries/data/0-dictionary-terms.xml"
        }

        ListElement {
            name: "dictionary 1"
            source: "qrc:/dictionaries/data/1-dictionary-terms.xml"
        }

        ListElement {
            name: "dictionary 2"
            source: "qrc:/dictionaries/data/2-dictionary-terms.xml"
        }

        ListElement {
            name: "dictionary 3"
            source: "qrc:/dictionaries/data/3-dictionary-terms.xml"
        }
    }*/


    function updateInfo(index) {
        var element = dictionary.get(index);
        term = element.name;
        transcriptionTerm = element.transcriptionName
        definition = element.description;
        context = element.context;
        synonym = element.synonym;
        transcriptionSynonym = element.transcriptionSynonym;
        setFullName(index);
    }

    function setFullName(index){
        var element = dictionary.get(index);
        fullName = element.name + " " + element.transcriptionName;
        if (synonym !== "") {
            fullName += " / " + element.synonym + " " + element.transcriptionSynonym;
        }
    }

    function rewritePath(index) {
        dictionaryPath = dictionaries.get(index).source;
        settings.setValue("currentPath", dictionaryPath);
    }

    function loadXmlListModel() {
        dictionary.reload();
    }

    function readPath() {
        dictionaryPath = settings.value("currentPath", "");
        return dictionaryPath;
    }

}

