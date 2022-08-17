import QtQuick 2.9

Item {
    property Param param : Param{
        unitQty: 5
        unit1: "Esc"
        unit2: "Apply"
        unit3: ""
        unit4: "Ohm"
        unit5: "mili\nOhm"
        title: "Setting constant resistance "
        param1Name: "Value:"
        param1Value:0
        range1: DoubleValidator{
            top:1000
            bottom: 0
        }
        range2: DoubleValidator{
            top:100
            bottom: 0
        }

    }
}
