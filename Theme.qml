import QtQuick 2.0

Item {
    property string textColor: "black"
    property string backColor: "white"
    property string borderColor: backColor
    property string warnTextColor: backColor
    property string warnBackColor: textColor
    property string warnBorderColor: textColor
    function warnOn(){
        initThemeItem.isWarnState=true;
    }
    function warnOff(){

        initThemeItem.isWarnState=false;
    }

    Item {
        id: initThemeItem;
        property bool isWarnState: false
    }
    function getTextColor(){
        if(initThemeItem.isWarnState){
            return warnTextColor;
        }
        return textColor;

    }
    function getBackColor(){
        if(initThemeItem.isWarnState){
            return warnBackColor;
        }
        return backColor;

    }
    function getBorderColor(){
        if(initThemeItem.isWarnState){
            return warnBorderColor;
        }
        return borderColor;

    }
    function getWarningState(){
        return initThemeItem.isWarnState;
    }
}
