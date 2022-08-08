#include "IFpadclass.h"
#include <QDebug>
#include <QList>
QList<PadClass*> *PadList=nullptr;
PadClass::PadClass(QObject *parent) : QObject(parent)
{
    if(PadList==nullptr){
        PadList=new QList<PadClass*>();
    }
    PadList->append(this);
    connect(this,&PadClass::Clicked,&PadClass::onClicked);
}

void PadClass::Init(QObject*parent, QString qtxt, PadMode qmode)
{
    this->parent=parent;
    this->txt=qtxt;
    this->mode=qmode;
    emit this->setText(qtxt);

    emit this->setMode(qmode);
}

void PadClass::setQmlClick(bool value)
{
    this->pressed=value;
    emit this->qmlClickChanged();
    emit this->Clicked();

}

bool PadClass::qmlClick()
{
    bool p=this->pressed;
    this->pressed=false;
    return p;
}

void PadClass::onClicked()
{

}
