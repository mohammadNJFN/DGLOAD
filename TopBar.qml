import QtQuick 2.0
import "qrc:/LCD/ItemBox"
import "qrc:/Theme"

import "qrc:/Utility.js" as Util

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

    Row{
        id:mainRow
        anchors.fill:parent
        spacing: (width-wunit*5-valBOX_Time.width)/5
        property int wunit: width/6.2;
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

       OneLineItemBox{
           id:emptyBox
           height:0;width:0
           visible: false
       }
       property size generalTitleSizeCoef: Qt.size(0.45,0.5);
       property size generalValueSizeCoef: Qt.size(0.14,0.5);
       property size timeTitleSizeCoef: Qt.size(0.16,0.5);
       OneLineItemBox{
           id:valBOX_I
           height:parent.height;
           width:parent.wunit; title: "I";
           valueTxt: "00.00"; unitName: "mA"
           titleSizeCoef: parent.generalTitleSizeCoef
           valSizeCoef: parent.generalValueSizeCoef
           theme:theme;
       }
       OneLineItemBox{
           id:valBOX_V
           height:parent.height;
           width:parent.wunit; title: "V";
           valueTxt: "00.00"; unitName: "mV"
           titleSizeCoef: parent.generalTitleSizeCoef
           valSizeCoef: parent.generalValueSizeCoef
           theme:theme;
       }
       OneLineItemBox{
           id:valBOX_P
           height:parent.height;
           width:parent.wunit; title: "P";
           valueTxt: "00.00"; unitName: "mW"
           titleSizeCoef: parent.generalTitleSizeCoef
           valSizeCoef: parent.generalValueSizeCoef
           theme:theme;
       }
       OneLineItemBox{
           id:valBOX_E
           height:parent.height;
           width:parent.wunit; title: "E";
           valueTxt: "00.00"; unitName: "mJ"
           titleSizeCoef: parent.generalTitleSizeCoef
           valSizeCoef: parent.generalValueSizeCoef
           theme:theme;
       }
       OneLineItemBox{
           id:valBOX_R
           height:parent.height;
           width:parent.wunit; title: "R";
           valueTxt: "00.00"; unitName: "m"+Util.bigOmega
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
