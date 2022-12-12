#pragma once

#include <QObject>
class PadModeClass
{
    Q_GADGET
public:
    explicit PadModeClass();
    enum Value{
        Simple=0,
        OneShot=1,
        Toggle=2,
        Controled=3
    };
    Q_ENUM(Value)

};

typedef PadModeClass::Value PadMode;

class PadClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool qmlClick READ qmlClick WRITE setQmlClick NOTIFY qmlClickChanged)
public:
    explicit PadClass(QObject *parent = nullptr);
    void Init(QObject*parent, QString qtxt,PadMode qmode);
signals:
    void qmlClickChanged();
    void Clicked();
    void setText(QString qtxt);
    void setMode(PadMode qmode);
    void setActiveImage(int qActiveImg);

public slots:
    void setQmlClick(bool value);
    bool qmlClick();
    virtual void onClicked();
private:
    bool pressed=false;
    int x=0;
    int y=0;
    QObject *parent;
    QString txt;
    PadMode mode;
};



