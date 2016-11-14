TARGET = harbour-dictionary-trainer

QT += qml quick

CONFIG += c++11 \
    sailfishapp \
    sailfishapp_i18n \

HEADERS += src/settings.h \
    src/sailfishapp.h

SOURCES += src/dictionary_trainer.cpp

include(lib/quickflux/quickflux.pri)

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256


RESOURCES += \
    dictionaries.qrc

DISTFILES += \
    qtquickcontrols2.conf \
    qml/sailfish-only/dictionary_trainer.qml \
    qml/sailfish-only/views/cover/CoverPage.qml \
    qml/actions/*.qml \
    qml/actions/qmldir \
    qml/store/*.qml \
    qml/store/qmldir \
    qml/adapters/*.qml \
    qml/scripts/*.qml \
    qml/sailfish-only/views/pages/*.qml \
    qml/sailfish-only/views/components/*.qml \
    harbour-dictionary-trainer.desktop \
    rpm/harbour-dictionary-trainer.spec \
    rpm/harbour-dictionary-trainer.yaml \
    rpm/harbour-dictionary-trainer.changes \
    rpm/data/*.xml \
    translations/*.ts \
    qml/android-only/views/pages/*.qml \
    qml/android-only/views/components/*.qml \
    qml/android-only/dictionary_trainer.qml \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

localization.files = localization
localization.path = /usr/share/harbour-dictionary-trainer/localization

INSTALLS += localization

TRANSLATIONS += translations/harbour-dictionary-trainer-ru.ts \

lupdate_only{
    SOURCES += QML/sailfish-only/views/pages/*.qml \
        QML/android-only/views/*.qml
}

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
