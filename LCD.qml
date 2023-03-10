import QtQuick 2.9

import "qrc:/menu"
import "qrc:/util"
Item {
    id:root
    property string paramFormName: ""
    property string fnKeyName: ""
    property string backgroundColor: "Black"
    property string curveColor: "White"
    property string textColor: "White"
    Param{
        id:zeroParam
    }
    CurrentModeForm{
        id:currentModeParamSetting
    }
    VolatgeModeForm{
        id:voltageModeFormSetting
    }
    PowerModeForm{
        id:powerModeFormSetting
    }
    ResistModeForm{
        id:resistModeFormSetting
    }
    onEnabledChanged: {
        menuRect.reset();
        root.paramFormName=""
    }

    onParamFormNameChanged: {
        var txt=paramFormName.toUpperCase()
        console.debug(txt)
        switch(txt){
        case "CURRENT":
            menuRect.param=currentModeParamSetting.param
            break;
        case "VOLTAGE":
            menuRect.param=voltageModeFormSetting.param;
            break;
        case "RESIST":
            menuRect.param=resistModeFormSetting.param;
            break;
        case "POWER":
            menuRect.param=powerModeFormSetting.param;
            break;
        case "OFF:CURRENT":
        case "OFF:VOLTAGE":
        case "OFF:RESIST":
        case "OFF:POWER":
            fnKeyName="MenuOff";
            break;
        default:
            break;
        }
    }
    onFnKeyNameChanged: {
        switch(fnKeyName){
        case "MenuOff":
            menuRect.menuOff();
            paramFormName="";
            menuRect.param=zeroParam
            break;
        case "F1":
            if(menuRect.param.getUnit(1)==="Esc")
                menuRect.menuOff();
                paramFormName="";
                menuRect.param=zeroParam
            break;
        case "F2":
            break;
        case "F3":
            break;
        case "F4":
            break;
        case "F5":
            break;

        }
        fnKeyName="";
    }

    Rectangle{
        id:mainRect
        anchors.fill: parent
        color: "#F0F0F0"
        border.width: 1
        border.color: backgroundColor
        radius:5

        Row{
            height:parent.height
            width: parent.width
            spacing: 10

            Column{
                id:displayColumn
                height: parent.height-2*parent.spacing
                width: parent.width-menuRect.width-2*parent.spacing
                x:0; y:5
                spacing: 5
                property Theme barTheme: Theme{
                    backColor: "transparent";//root.backgroundColor
                    textColor: root.textColor
                }
                TopBar{

                    height: parent.height*0.04
                    width: parent.width
                    theme:parent.barTheme
                }

                Rectangle{
                    id:disp
                    height: parent.height*0.87
                    width: parent.width
                    CurveView{
                        id:curveview
                        height: parent.height
                        width: parent.width
                        color: "black"
                        curveColor: "yellow"
                        axisColor:"white"
                        gridColor: "white"
                        Component.onCompleted: {
                            for(var i=0;i<20;i++){
                                addPoint(40+0.1*i*i-i);
                            }
                            showCurve();
                        }
                        property Timer changeWaitTim:Timer{
                            interval: 200
                            onTriggered: {
                                parent.autoScaleCurve()
                                parent.showCurve();
                            }
                        }

                        onWidthChanged: {
                            changeWaitTim.start();
                        }
                        onHeightChanged: {
                            changeWaitTim.start();
                        }

                    }
                    property Timer testTim: Timer{
                        interval: 1000
                        onTriggered: {
                            var i=0
                            curveview.resetCurve();
                            for( i=0;i<=20;i++){
                                if(i<5){
                                    curveview.addPoint(45);
                                }
                                else if(i<10){
                                    curveview.addPoint(0);
                                }
                                else if(i<15){
                                    curveview.addPoint(60);
                                }
                                else if(i<=20){
                                    curveview.addPoint(99);
                                }
                            }
                            curveview.showCurve();

                        }
                    }
                    Component.onCompleted: {
                        testTim.start();
                    }

                }
                BottomBar{
                    height: parent.height*0.08
                    width: parent.width
                    theme:parent.barTheme

                }
            }

            SetParamDisplay{
                id: menuRect
                y:10
                maxWidth: parent.width*0.5-parent.spacing
                height: parent.height-2*parent.spacing
                width: 0
                param: mainRect.obj
                backgroundColor: root.backgroundColor
                textColor: "white"
                innerBorderColor: "white"
                outerBorderColor: "white"

            }
        }

    }
}
