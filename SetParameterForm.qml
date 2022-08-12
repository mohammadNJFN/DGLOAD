import QtQuick 2.0

Item {
    id:root
    Rectangle{
        id:rect0
        property int unitQty: 0
        property int paramQty: 0
    }

    LoadProgForm{
        id:ldFrm
    }

    property string bColor: "white"
    property Item  obj: ldFrm
    Rectangle{
        id:rect1
        anchors.fill: root
        color: root.bColor

        Row{
            Column{
               id:setParamCol

            }
            Column{
                id:setUnitCol
            }
        }
        MouseArea{
            id:pmmm
            anchors.fill: parent
            onClicked: {
                console.log("ooo=",obj.params.getUnit(5))
            }
        }

    }
}
