import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import com.Najafian.PadMode 1.0
import "qrc:/menu"
import "qrc:/LCD"
import "qrc:/Keypad"
import "qrc:/Keypad/Pad"
Window {
    id :mainWindow
    visible: true
    width: 640
    height: 480

    title: qsTr("DL")

    property  string rcvtxt: "value"
    property bool isActive: false
    property bool isStart: false
    readonly property double generalHFTC: 0.4
    readonly property double generalWFTC: 0.25

    property bool onVisibilityFlag: false
    property bool onWidthFlag:      false

    function changeSizeEffects(){
        var mw=row1.width-lcd.width-keypad.width-fkeypad.width-15*row1.spacing
        midrect.width=(mw>0)?mw:0;
    }
    Timer{
        id:changeSizeTimer
        interval: 100;
        onTriggered: {
            if(onVisibilityFlag){

                changeSizeEffects();
            }
            if(onWidthFlag){

                changeSizeEffects();
            }
        }
    }
    Component.onCompleted: {
        mainWindow.showFullScreen();
    }
    onVisibilityChanged: {
        onVisibilityFlag=true;
        changeSizeTimer.start();
    }
    onWidthChanged: {
        onWidthFlag=true;
        changeSizeTimer.start();
    }

    Column{

        id:col1
        spacing: 10
        height: parent.height-10
        width:parent.width-10
        property int spsc: 30
        Row{
            id:headerRow
            width: parent.width
            height: parent.height*0.05
            spacing: parent.spacing
            property int w1: width/10;
            property int h1: height;
            Button{
                id:minimizeBtn
                width: 20
                height: 20
                text: "-"
                onClicked: {
                    fullscreenBtn.visible=true;
                    mainWindow.showMinimized()
                    visible=false
                }
            }
            Button{
                id:fullscreenBtn
                width: 25
                height: 20
                text: "FS"
                visible: false
                onClicked: {
                    mainWindow.showFullScreen();
                    minimizeBtn.visible=true
                    visible=false
                }
            }

            Button{
                id:closeBtn
                width: 20
                height: 20
                text: "X"
                onClicked: {
                    mainWindow.close()
                }
            }

            Rectangle{
                id:topSpcRect1
                height: parent.h1
                width: parent.width-(parent.w1+col1.spsc)
            }

        }
        Row{
            id:row1
            spacing: 10
            width: parent.width
            height: parent.height*0.8
            Rectangle{
                width: 0
                height: parent.height

                color:"black"
            }

            LCD{
                id:lcd
                width: parent.width*0.5
                height: parent.height
                enabled: onOffBtn.isOn
            }

            FuncKeypad{
                id:fkeypad
                width:parent.width/20
                height: parent.height
                onSend: {
                    lcd.fnKeyName=msg;
                }
            }

            Rectangle{
                id:midrect
                height: parent.height
            }
            Column{
                id:midcol
                height: parent.height
                width: parent.width*0.3
                spacing: 10
                Rectangle{
                    height: parent.height*0.15
                    width: parent.width
                }

                Keypad{
                    id:keypad
                    width:  parent.width
                    height: parent.height*0.6
                    enabled: onOffBtn.isOn
                    unLockAll: unlockBtn.isUnlocked
                    onSelectLoad: {
                       lcd.paramFormName=loadname
                        console.debug("onSelectLoad:",loadname)
                    }
                }
                Rectangle{
                    width: parent.width
                    height:headerRow.h1*2.5
                }

                Pad{
                    id:startBtn
                    height:headerRow.h1;
                    width :headerRow.w1;
                    x:keypad.x  + (keypad.width)/2
                    bText: "Start/Stop"
                    mode:PadMode.Controled
                    firstImgSelect: 2
                    secoundImgSelect: 1
                    hFTC: mainWindow.generalHFTC
                    wFTC: mainWindow.generalWFTC
                    enabled: onOffBtn.isOn;
                    onHold: {
                        if(isStart===false){
                            isStart=true;
                            bImgSelect=secoundImgSelect;
                        }
                    }
                    onPressed: {
                        if(isStart){
                            isStart=false;
                            bImgSelect=firstImgSelect;
                        }
                    }
                }
            }

        }
        Row{
            id:footerRow
            width: parent.width
            height: parent.height*0.1
            spacing: parent.spacing
            property int w1: width/15;
            property int h1: height-10;
            Pad{
                visible: false
                width: 0
                height: 0
            }

            Rectangle{
                width: col1.spsc
                height: parent.h1
            }

            Pad{
                id:onOffBtn
                height:parent.h1;
                width :parent.w1
                bText: "On/Off"
                mode:PadMode.Controled
                firstImgSelect: 2
                secoundImgSelect: 1
                activeBeep:false
                property  bool isOn:false
                hFTC: mainWindow.generalHFTC
                wFTC: mainWindow.generalWFTC

                onHold: {
                    if(isOn){
                        keypad.resetAll();
                        isOn=false
                        bImgSelect=2
                        activeBeep=false;
                        unlockBtn.enabled=false
                    }
                    else{
                        isOn=true
                        unlockBtn.enabled=true
                        unlockBtn.unSelect();

                        bImgSelect=1
                        activeBeep=true;
                    }
                }
            }
            Rectangle{
                id:footerSpcRect1
                height: parent.h1
                width: lcd.width-2*(parent.w1+col1.spsc)

            }
            Pad{
                id:unlockBtn
                property bool isUnlocked: false
                height:parent.h1;
                width :parent.w1;
                bText: "Unlock"
                mode:PadMode.Controled
                firstImgSelect:2
                secoundImgSelect: 1
                enabled: false
                hFTC: mainWindow.generalHFTC
                wFTC: mainWindow.generalWFTC
                bImgSelect: firstImgSelect
                onEnabledChanged: {
                    isUnlocked=false
                    if(enabled){
                        bImgSelect=firstImgSelect;
                    }
                }

                onPressed:{
                    if(isUnlocked){
                        isUnlocked=false
                        bImgSelect=firstImgSelect
                        activeBeep=false
                    }
                }
                onHold: {
                    if(isUnlocked===false){
                        isUnlocked=true
                        bImgSelect=secoundImgSelect
                        activeBeep=true
                    }
                }
            }


        }
    }
}
