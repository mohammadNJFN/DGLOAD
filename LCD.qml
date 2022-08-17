import QtQuick 2.0
import "qrc:/menu"
Item {
    id:root
    property string paramFormName: ""
    property string fnKeyName: ""
    property string backgroundColor: "Black"
    property string curveColor: "White"
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
        default:
            break;
        }
    }
    onFnKeyNameChanged: {
        switch(fnKeyName){
        case "MenuOff":
            menuRect.menuOff();
            break;
        case "F1":
            if(menuRect.param.getUnit(1)==="Esc")
                menuRect.menuOff();
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
        x:root.x;   y:root.y;
        height: root.height
        width: root.width
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
                x:5; y:5
                spacing: 5

                Row{
                    id:headerRow;
                    Rectangle{
                        width: displayColumn.width
                        height: displayColumn.height*0.1
                        color: backgroundColor
                    }
                }
                Rectangle{
                    id:disp
                    color: backgroundColor
                    height: parent.height*0.8
                    width: parent.width
                    Canvas{
                        id:cnvs

                        anchors.fill: parent
                        onPaint: {
                            // get context to draw with
                            var ctx = getContext("2d")
                            // setup the stroke
                            ctx.lineWidth = 4
                            ctx.strokeStyle = curveColor
                            // setup the fill
                            ctx.fillStyle = "steelblue"
                            // begin a new path to draw
                            ctx.beginPath()
                            // top-left start point
                            ctx.moveTo(50,50)
                            // upper line
                            ctx.lineTo(150,50)
                            // right line
                            ctx.lineTo(150,150)
                            // bottom line
                            ctx.lineTo(50,150)
                            // left line through path closing
                            ctx.closePath()
                            // fill using fill style
                            ctx.fill()
                            // stroke using line width and stroke style
                            ctx.stroke()
                        }
                    }
                }
                Row{
                    id:footerRow;
                    Rectangle{
                        width: displayColumn.width
                        height: displayColumn.height*0.1
                        color: backgroundColor
                    }
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
