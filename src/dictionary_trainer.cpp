#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#ifndef Q_OS_ANDROID
#include "sailfishapp.h"
#endif
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <QQmlComponent>
#include <QQmlContext>
#include <QQmlEngine>
#include <QDir>
#include <QStandardPaths>
#include <QGuiApplication>
#include <QQuickView>
#include "settings.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_ANDROID)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    qmlRegisterType<Settings>("harbour.dictionary.trainer.settings", 1, 0, "Settings");

    QSettings settings("FRUCT", "Dictionary Trainer");
    QQmlEngine qmlEngine;
    qmlEngine.rootContext()->setContextProperty("settings", &settings);
    QQmlComponent settingsComponent(&qmlEngine, QUrl("qrc:/qml/qml/store/TermInformationStore.qml"));
    settingsComponent.create();

    QSettings data("FRUCT", "Dictionary Trainer");
    qmlEngine.rootContext()->setContextProperty("data", &data);
    QQmlComponent dataComponent(&qmlEngine, QUrl("qrc:/qml/qml/store/TestStore.qml"));
    dataComponent.create();

    QTranslator translator;
    translator.load(":/translations/translations/harbour-dictionary-trainer-" + QLocale::system().name().left(2) + ".qm");
    app.installTranslator(&translator);

    QQmlApplicationEngine engine;
    engine.load(QUrl("qrc:/qml/qml/android-only/dictionary_trainer.qml"));

    return app.exec();
#else
    QGuiApplication* app =  SailfishApp::application(argc, argv);
    QString locale = QLocale().name();
    QQuickView* view = SailfishApp::createView();

    qmlRegisterType<Settings>("harbour.dictionary.trainer.settings", 1, 0, "Settings");

    QSettings settings("FRUCT", "Dictionary Trainer");
    settings.setPath(QSettings::NativeFormat, QSettings::UserScope,
                     QDir(QStandardPaths::writableLocation(QStandardPaths::ConfigLocation))
                     .filePath(QCoreApplication::applicationName()));
    QQmlEngine* qmlEngine = view->engine();
    qmlEngine->rootContext()->setContextProperty("settings", &settings);
    QQmlComponent settingsComponent(qmlEngine, QUrl("TermInformationStore.qml"));
    settingsComponent.create();

    QSettings data("FRUCT", "Dictionary Trainer");
    data.setPath(QSettings::NativeFormat, QSettings::UserScope,
                 QStandardPaths::writableLocation(QStandardPaths::DataLocation));
    qmlEngine->rootContext()->setContextProperty("data", &data);
    QQmlComponent dataComponent(qmlEngine, QUrl("TestStore"));
    dataComponent.create();

    QTranslator translator;
    translator.load("dictionary_trainer-" + locale, SailfishApp::pathTo(QString("localization")).toLocalFile());
    app->installTranslator(&translator);

    Q_INIT_RESOURCE(dictionaries);
    view->setSource(SailfishApp::pathTo("qml/sailfish-only/dictionary_trainer.qml"));
    view->showFullScreen();
    QObject::connect(view->engine(), &QQmlEngine::quit, app, &QGuiApplication::quit);
    return app->exec();
#endif
}
