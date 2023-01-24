#ifndef MYOBJECT_H
#define MYOBJECT_H

#include <QObject>
#include <QtQml>

class MyObject : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit MyObject(QObject *parent = nullptr);
    static MyObject* getInstance() {
        static MyObject* instance = new MyObject();
        return  instance;
    }

    // Qml端直接访问C++函数，加 Q_INVOKABLE 宏
    Q_INVOKABLE void func();

    int iValue() const;
    void setIValue(int newIValue);

    QString sString() const;
    void setSString(const QString &newSString);

public slots:
    void cppSlot(QVariant i, QVariant s);

signals:
    void iValueChanged();

    void sStringChanged();

private:
    int m_iValue;
    QString m_sString;

    Q_PROPERTY(int iValue READ iValue WRITE setIValue NOTIFY iValueChanged)
    Q_PROPERTY(QString sString READ sString WRITE setSString NOTIFY sStringChanged)
};

#endif // MYOBJECT_H
