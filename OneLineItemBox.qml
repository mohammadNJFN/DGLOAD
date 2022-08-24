import QtQuick 2.0
import "qrc:/util"
Item {
    id:root
    property string title: ""
    property string unitName: "UL"
    property Theme theme: Theme{}
    property string valueTxt: "0.00"
    property int titleWidth: 0

    property size valSizeCoef: Qt.size(0.3,0.5);
    property size titleSizeCoef: Qt.size(0.3,0.5);

    function warnOff(){
        theme.warnOff();
    }

    function warnOn(){
        theme.warnOn();
    }
    function getWarningState(){
        return theme.getWarningState();
    }

    Row{
        id:row
        anchors.fill:parent
        property int valdigitLen: 5
        property double wunit: width/(valdigitLen+root.title.length+5)
        property size valSize:Qt.size((valdigitLen+3)*wunit,height)
        property size txtSize: Qt.size((width-valSize.width),height);
        ItemBoxBase{
            id:titleBox
            height:parent.txtSize.height
            width: parent.txtSize.width
            theme: root.theme;
            text:  root.title+":"
            textSizeCoef: root.titleSizeCoef;
            hAlignment: Text.AlignRight
        }
        ItemBoxBase{
            id:valueBox
            height:parent.valSize.height
            width: parent.valSize.width
            theme:root.theme;
            text: (root.valueTxt.concat(root.unitName));
            textSizeCoef: root.valSizeCoef;
            hAlignment: Text.AlignLeft
        }
    }
}
