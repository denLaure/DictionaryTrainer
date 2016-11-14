#ifndef SETTINGS
#define SETTINGS

#include <QObject>
#include <QSettings>
#include <QStringList>

class Settings : public QObject
{
    Q_OBJECT
public:
    Q_INVOKABLE void setValue(const QString & key, const QVariant & value) {
        settings.setValue(key, value);
    }

    Q_INVOKABLE QVariant value(const QString &key, const QVariant &defaultValue = QVariant()) const {
        return settings.value(key, defaultValue);
    }

    Q_INVOKABLE bool contains(const QString &key) const {
        return settings.contains(key);
    }

    Q_INVOKABLE void clear() {
        settings.clear();
    }

    Q_INVOKABLE QStringList childGroups() const {
        return settings.childGroups();
    }

    Q_INVOKABLE double valueAsDouble(const QString &key, const QVariant &defaultValue = QVariant()) const {
        return settings.value(key, defaultValue).toDouble();
    }

    Q_INVOKABLE int valueAsInt(const QString &key, const QVariant &defaultValue = QVariant()) const {
        return settings.value(key, defaultValue).toInt();
    }
signals:
public slots:
private:
    QSettings settings;
};

#endif // SETTINGS

