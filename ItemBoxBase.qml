import QtQuick 2.0
import QtQuick.Controls 2.2

import "qrc:/Utility.js" as Utility
import "qrc:/Theme"
Item {
    id:root
    property Theme theme: Theme{}
    property string text: ""
    property size textSizeCoef: Qt.size(0.3,0.5);
    property int borderWidth: 1
    property int hAlignment:TextArea.AlignLeft;
    property int vAlignment:TextArea.AlignVCenter;

    function warnOn(){
        theme.warnOn();
    }
    function warnOff(){
        theme.warnOff();
    }
    function getWarningState(){

        return theme.getWarningState();
    }
    Rectangle{
        anchors.fill: parent
        color: root.theme.getBackColor();
        border.width: root.borderWidth
        border.color: "Orange";//root.theme.getBorderColor();
        TextArea{
            id:txtField
            anchors.margins: 0
            anchors.fill: parent
            color: root.theme.getTextColor();
            text:root.text
            verticalAlignment: root.vAlignment
            horizontalAlignment: root.hAlignment
            font.pointSize:Utility.calcFontSize(width,height,(textSizeCoef.width),textSizeCoef.height)

        }
    }

}
