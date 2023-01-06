import QtQuick 2.0
import "qrc:/Theme"

Item {
    id:root
    property string title: ""
    property string upUnitName: "UL"
    property string downUnitName: "UL"
    property Theme theme: Theme{}
    property string upValueTxt: "0.00"
    property string downValueTxt: "0.00"
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
        property size valSize:Qt.size((valdigitLen+3)*wunit,height/2-1)
        property size txtSize: Qt.size((width-valSize.width),height);

        ItemBoxBase{
            id:titleBox
            height:row.txtSize.height
            width: row.txtSize.width
            theme: root.Theme;
            text:  root.title+":"
            textSizeCoef: root.titleSizeCoef;
            hAlignment: Text.AlignRight
        }
        Column{
            ItemBoxBase{
                id:upValueBox
                height:row.valSize.height
                width: row.valSize.width
                theme:root.Theme;
                text: (root.upValueTxt.concat(root.upUnitName));
                textSizeCoef: root.valSizeCoef;
                hAlignment: Text.AlignLeft
            }
            Rectangle{
                width: row.valSize.width
                height: 2;
                color:root.theme.getTextColor();
            }

            ItemBoxBase{
                id:downValueBox
                height:row.valSize.height
                width: row.valSize.width
                theme:root.Theme;
                text: root.downValueTxt.concat(root.downUnitName);
                textSizeCoef: root.valSizeCoef;
                hAlignment: Text.AlignLeft
            }
            ///

        }

    }
}
