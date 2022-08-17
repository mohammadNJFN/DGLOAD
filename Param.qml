import QtQuick 2.9

Item {

    property int unitQty: 5
    property int paramQty: 0
    property string unit1: "unit1"
    property string unit2: "unit2"
    property string unit3: "unit3"
    property string unit4: "unit4"
    property string unit5: "unit5"
    property bool unit1Enable: false
    property bool unit2Enable: false
    property bool unit3Enable: false
    property bool unit4Enable: false
    property bool unit5Enable: false
    property string title: "Untitled"
    property string param1Name: "NoDefined"
    property string param2Name: "NoDefined"
    property int paramCount: 1
    property real param1Value: 0
    property real param2Value: 0
    property DoubleValidator range1:DoubleValidator{
        bottom:0.0
        top:1.0
    }
    property DoubleValidator range2:DoubleValidator{
        bottom:0.0
        top:1.0
    }
    property DoubleValidator range3:DoubleValidator{

        bottom:0.0
        top:1.0
    }

    property int selectedRange: 1

    function getUnit(unitNum){
        switch(unitNum){
        case 1:
            return unit1;
        case 2:
            return unit2;
        case 3:
            return unit3;
        case 4:
            return unit4;
        case 5:
            return unit5;
        default:
            return "";
        }
    }
    function getUnitEnabled(unitNum){
        switch(unitNum){
        case 1:
            return unit1Enable;
        case 2:
            return unit2Enable;
        case 3:
            return unit3Enable;
        case 4:
            return unit4Enable;
        case 5:
            return unit5Enable;
        default:
            return false;
        }

    }

}
