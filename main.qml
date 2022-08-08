import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import com.Najafian.PadMode 1.0

Window {
    id :mainWindow
    visible: true
    width: 640
    height: 480

    title: qsTr("DL")

    property  string rcvtxt: "value"
    property bool isActive: false;
    property bool  isStart: false
    readonly property double generalHFTC: 0.4
    readonly property double generalWFTC: 0.25
    Component.onCompleted: {
        mainWindow.showMaximized();
    }

    function calcFontSize(){
        var t1=parent.height*root.generalHFTC;
        var t2=parent.width*root.generalWFTC;
        var fs=(t1<t2)?t1:t2;
        return fs;
    }

    Text{
        x:0;
        y:0;
        width: 50;
        height: 30;
        text: rcvtxt;
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
            Pad{
                visible: false
                width: 0
                height: 0
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

            LCD{
                id:lcd
                width: parent.width*0.5
                height: parent.height
                enabled: onOffBtn.isOn
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
                Keypad{
                    id:keypad
                    width:  parent.width
                    height: parent.height*0.6
                    enabled: onOffBtn.isOn
                    unLockAll: unlockBtn.isUnlocked
                }
                Rectangle{
                    width: parent.width
                    height:headerRow.h1*2.5
                }

                Pad{
                    id:startBtn
                    height:headerRow.h1;
                    width :headerRow.w1;
                    x:(keypad.width)/2
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

            Component.onCompleted: {
                midrect.width=parent.width-lcd.width-keypad.width-20
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
                    }
                    else{
                        isOn=true
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
                enabled: onOffBtn.isOn
                hFTC: mainWindow.generalHFTC
                wFTC: mainWindow.generalWFTC
                Component.onCompleted: {
                    if(isUnlocked)
                        bImgSelect=secoundImgSelect;
                    else
                        bImgSelect=firstImgSelect;
                }
                onEnabledChanged: {
                    isUnlocked=false
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
