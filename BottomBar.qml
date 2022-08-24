import QtQuick 2.0
import "qrc:/LCD/ItemBox"
import "qrc:/util"
Item {
    id:root
    property Theme theme: Theme{}
    function warnOff(itemName){
        var box=mainRow.selectBoxByTitle(itemName)
        if(box===emptyBox){
            console.error("Call no defined item:",itemName);
            return;
        }
        box.warnOff();
    }
    function warnOn(itemName){
        var box=mainRow.selectBoxByTitle(itemName)
        if(box===emptyBox){
            console.error("Call no defined item:",itemName);
            return;
        }
        box.warnOn();
    }
    function itemShow(itemName){
        var box=mainRow.selectBoxByTitle(itemName)
        if(box===emptyBox){
            console.error("Call no defined item:",itemName);
            return;
        }
        box.visible=true;
    }
    function itemHide(itemName){
        var box=mainRow.selectBoxByTitle(itemName)
        if(box===emptyBox){
            console.error("Call no defined item:",itemName);
            return;
        }
        box.visible=false;
    }

    function itemSetValue(itemName,value){
        var box=mainRow.selectBoxByTitle(itemName)
        if(box===emptyBox){
            console.error("Call no defined item:",itemName);
            return;
        }
        if(typeof(value)===String)
            box.valueTxt=value;
        else
            box.valueTxt=value.toFixed(2).toString();
    }
    function itemSetTheme(itemName,value){
        var box=mainRow.selectBoxByTitle(itemName)
        if(box===emptyBox){
            console.error("Call no defined item:",itemName);
            return;
        }
        box.theme=value;
    }
    Utility{
        id:util;
    }

    Row{
        id:mainRow
        anchors.fill:parent
        spacing: (width-wunit*5-valBOX_Time.width)/5
        property int wunit: width/6.2;
        property size generalTitleSizeCoef: Qt.size(0.45,0.5);
        property size generalValueSizeCoef: Qt.size(0.14,0.5);
        property size timeTitleSizeCoef: Qt.size(0.16,0.5);
        function selectBoxByTitle(itemName){
            var ctxt=itemName.toUpperCase();
            switch(ctxt){
            case valBOX_I.title.toUpperCase():
                return valBOX_I;
            case valBOX_V.title.toUpperCase():
                return valBOX_V;
            case valBOX_P.title.toUpperCase():
                return valBOX_P;
            case valBOX_E.title.toUpperCase():
                return valBOX_E;
            case valBOX_R.title.toUpperCase():
                return valBOX_R;
            case valBOX_Time.title.toUpperCase():
                return valBOX_Time;
             default:
                return emptyBox;
            }
        }
        TwoLineItemBox{

            id:valBOX_I
            height:parent.height;
            width:parent.wunit; title: "I";
            upValueTxt: "00.00"; downValueTxt:"00.00";
            upUnitName: "A"
            downUnitName: "mA"
            titleSizeCoef: parent.generalTitleSizeCoef
            valSizeCoef: parent.generalValueSizeCoef
            theme:theme;
        }
        TwoLineItemBox{

            id:valBOX_V
            height:parent.height;
            width:parent.wunit; title: "V";
            upValueTxt: "00.00"; downValueTxt:"00.00";
            upUnitName: "V"
            downUnitName: "mV"
            titleSizeCoef: parent.generalTitleSizeCoef
            valSizeCoef: parent.generalValueSizeCoef
            theme:theme;
        }
        TwoLineItemBox{

            id:valBOX_P
            height:parent.height;
            width:parent.wunit; title: "P";
            upValueTxt: "00.00"; downValueTxt:"00.00";
            upUnitName: "W"
            downUnitName: "mW"
            titleSizeCoef: parent.generalTitleSizeCoef
            valSizeCoef: parent.generalValueSizeCoef
            theme:theme;
        }
        TwoLineItemBox{

            id:valBOX_E
            height:parent.height;
            width:parent.wunit; title: "E";
            upValueTxt: "00.00"; downValueTxt:"00.00";
            upUnitName: "J"
            downUnitName: "mJ"
            titleSizeCoef: parent.generalTitleSizeCoef
            valSizeCoef: parent.generalValueSizeCoef
            theme:theme;
        }
        TwoLineItemBox{

            id:valBOX_R
            height:parent.height;
            width:parent.wunit; title: "R";
            upValueTxt: "00.00"; downValueTxt:"00.00";
            upUnitName: util.bigOmega
            downUnitName: "m"+util.bigOmega;
            titleSizeCoef: parent.generalTitleSizeCoef
            valSizeCoef: parent.generalValueSizeCoef
            theme:theme;
        }
        OneLineItemBox{
            id:valBOX_Time

            height:parent.height;
            width:1.2*parent.wunit; title: "Time";
            valueTxt: "00:00:00"; unitName: ""
            titleSizeCoef: parent.timeTitleSizeCoef
            valSizeCoef: parent.generalValueSizeCoef

            theme:theme;
        }
    }
}
