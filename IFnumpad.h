#pragma once

#include <QObject>

class Numpad:public QObject
{
    Q_OBJECT
public:
    explicit Numpad(QObject *parent=nullptr);
    void Init();
public slots:
signals:

private:
};
