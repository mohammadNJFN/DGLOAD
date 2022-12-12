#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "IFpadclass.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/main.qml"));


    qRegisterMetaType<PadMode>("PadMode");
    qmlRegisterUncreatableType<PadModeClass>("com.Najafian.PadMode",1,0,"PadMode",
                                         "Not creatable as it is an enum type");


    /*
    qmlRegisterType<PadClass>("padclass",1,0,"PadCode");
    extern QList<PadClass*> *PadList;
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        PadList->at(0)->Init(nullptr,"test",PadMode::Controled);
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    */



    engine.load(url);



    return app.exec();
}
