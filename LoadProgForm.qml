import QtQuick 2.0

Item {
    property Item params : paramGrp
    Param{
        id: paramGrp
        unitQty: 4
        unit2: "Select"
        unit4: "Up"
        unit5: "Down"
        title: "Select a saved programm"
    }
}
