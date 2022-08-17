import QtQuick 2.9
import QtQuick.Controls 2.2
Item {
    id:root
    property Param zeroParam: Param{
        title: ""
        unit1: ""
        unit2: ""
        unit3: ""
        unit4: ""
        unit5: ""

    }

    property Param param: zeroParam
    property  int maxWidth:0
    property int targetWidth: 0
    property bool active: false
    property string backgroundColor: "white"
    property string textColor: "black"
    property string innerBorderColor: "black"
    property int innerBorderWidth: 1
    property string outerBorderColor: "black"
    property int outerBorderWidth: 3
    z:2

    SequentialAnimation{
        id:openMenuAnimation
        running:true

        NumberAnimation {
            target: root
            property: "width"
            easing.overshoot: 1.5
            to:targetWidth
            duration: 500
            easing.type: Easing.OutBack
        }

    }
    onParamChanged: {
        console.debug("title=",param.title)
        if(param!==zeroParam){
            targetWidth=maxWidth
            console.debug("menu change width")
            active=true;
        }
        else{
            targetWidth=0
            active=false;
        }
        openMenuAnimation.running=true;

        console.debug("menu width=",width)
        console.debug("menu maxWidth=",maxWidth)
        setParameterRect.calcHeights(param.paramCount);
    }
    function reset(){
        width=0
        param=zeroParam

    }
    function menuOff(){
        param=zeroParam
    }

    function calcFontsize(w,h,wC,hC){
        var fs;
        if(hC===0)
            hC=wC
        else if(wC===0)
            wC=hC
        var t1=h*hC
        var t2=w*wC
        fs=(t1<t2)?t1:t2;
        fs=(fs>0.0001)?fs:0.0001;
        return fs;
    }
    Rectangle{
        height: root.height-3
        width: root.width-3
        border.color: root.outerBorderColor
        border.width: root.outerBorderWidth
        color:backgroundColor

        Row{
            Rectangle{
                id:setParameterRect
                height:root.height
                width: root.width*0.8
                border.width:root.innerBorderWidth
                border.color: root.innerBorderColor
                color:backgroundColor
                property int hSpace1: 0
                property int h1: 0
                property int hSpace2: 0
                property int h2: 0
                property int hSpace3: 0
                function calcHeights(paramCount){
                    h1=height*0.1;
                    if(paramCount===1)
                        h2=0;
                    else if(paramCount===2)
                        h2=h1
                    hSpace2=2*h2;
                    hSpace1=(height-h1-h2-hSpace2)/2;
                    hSpace3=hSpace1;
                }
                Column{
                    anchors.fill: parent
                    Rectangle{
                        id:hSpace1Rect
                        width: parent.width
                        height: parent.parent.hSpace1
                        color:backgroundColor

                    }
                    Rectangle{
                        id:h1Rect
                        width: parent.width
                        height: parent.parent.h1
                        color:backgroundColor

                        property double bottomValue: 0
                        property double  topValue : 1
                        property DoubleValidator range: root.param.range1
                        function rangeUpdate(){
                            switch(root.param.selectedRange){
                            case 1:
                                range=root.param.range1;
                                break;
                            case 2:
                                range=root.param.range2;
                                break;
                            case 3:
                                range=root.param.range3;
                                break;
                            }
                            return range;
                        }

                        Row{
                            height: parent.height-4
                            width: parent.width
                            Label{
                                id:param1NameLable
                                width:  parent.width*0.4

                                height: parent.height
                                font.pointSize: root.calcFontsize(width,height,0.3,0.3);
                                text:root.param.param1Name
                                background:Rectangle{
                                    anchors.fill: parent
                                    color:backgroundColor
                                }
                                color: textColor
                                verticalAlignment: Label.AlignVCenter
                                horizontalAlignment: Label.AlignRight
                            }

                            TextField{

                                id:param1SetTextEdit
                                validator:  parent.parent.rangeUpdate();
                                width: parent.width*0.95-param1NameLable.width
                                height: parent.height
                                verticalAlignment: TextField.AlignVCenter
                                font.bold: true
                                color: textColor

                                background: Rectangle{
                                    anchors.fill: parent
                                    color: backgroundColor
                                    border.width: innerBorderWidth
                                    border.color: innerBorderColor
                                }

                                text:root.param.param1Value.toString();
                                font.pointSize: root.calcFontsize(width,height,0.3,0.5);
                                readOnly: true
                            }

                            Label{
                                id:param1UnitLable
                                width: parent.width-param1SetTextEdit.width
                                height: parent.height
                                verticalAlignment: Label.AlignVCenter

                                color: textColor
                                background:Rectangle{
                                    anchors.fill: parent
                                    color:backgroundColor
                                }
                                font.pointSize: root.calcFontsize(width,height,0.3,0.5);
                            }
                        }
                    }
                    Rectangle{
                        id:hSpace2Rect
                        width: parent.width
                        color: backgroundColor
                        height: parent.parent.hSpace2
                    }
                    Rectangle{
                        id:h2Rect
                        width: parent.width
                        color: backgroundColor
                        height: parent.parent.h2
                    }
                    Rectangle{
                        id:hSpace3Rect
                        width: parent.width
                        color: backgroundColor
                        height: parent.parent.hSpace3
                    }
                }
            }
            Rectangle{
                id:unitSelectorRect
                height:root.height
                width:root.width-setParameterRect.width
                color: backgroundColor
                Column{
                    id:unitCol1
                    anchors.fill: parent

                    property int w1:width

                    property int h1: height/6;
                    property double wC: 0.2
                    property double hC: 0.5
                    Rectangle{
                        id:rec0
                        width: unitCol1.w1
                        height: unitCol1.h1/2
                        color: backgroundColor
                    }
                    Rectangle{
                        id:rec1
                        width: unitCol1.w1
                        height: unitCol1.h1
                        border.width:root.innerBorderWidth
                        border.color: root.innerBorderColor

                        color: backgroundColor

                        Text {
                            id: f1Txt
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment:Text.AlignVCenter
                            text: root.param.getUnit(1)

                            color: textColor
                            font.pointSize:root.calcFontsize(width,height,
                                                             unitCol1.wC,unitCol1.hC);
                        }
                    }
                    Rectangle{
                        id:rec2
                        width: unitCol1.w1
                        height: unitCol1.h1
                        border.width:root.innerBorderWidth
                        border.color: root.innerBorderColor

                        color: backgroundColor
                        Text {
                            id: f2Txt
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment:Text.AlignVCenter

                            color: textColor
                            text: root.param.getUnit(2)
                            font.pointSize:root.calcFontsize(width,height,
                                                             unitCol1.wC,unitCol1.hC);
                        }
                    }
                    Rectangle{
                        id:rec3
                        width: unitCol1.w1
                        height: unitCol1.h1
                        border.width:root.innerBorderWidth
                        border.color: root.innerBorderColor

                        color: backgroundColor
                        Text {
                            id: f3Txt
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment:Text.AlignVCenter

                            color: textColor
                            text: root.param.getUnit(3)
                            font.pointSize:root.calcFontsize(width,height,
                                                             unitCol1.wC,unitCol1.hC);
                        }
                    }
                    Rectangle{
                        id:rec4
                        width: unitCol1.w1
                        height: unitCol1.h1
                        border.width:root.innerBorderWidth
                        border.color: root.innerBorderColor

                        color: backgroundColor
                        Text {
                            id: f4Txt
                            anchors.fill: parent
                             horizontalAlignment: Text.AlignHCenter
                            verticalAlignment:Text.AlignVCenter

                            color: textColor
                            text: root.param.getUnit(4)
                            font.pointSize:root.calcFontsize(width,height,
                                                             unitCol1.wC,unitCol1.hC);
                        }
                    }
                    Rectangle{
                        id:rec5
                        width: unitCol1.w1
                        height: unitCol1.h1

                        border.width:root.innerBorderWidth
                        border.color: root.innerBorderColor
                        color: backgroundColor
                        Text {
                            id: f5Txt
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment:Text.AlignVCenter

                            color: textColor
                            text: root.param.getUnit(5)
                            font.pointSize:root.calcFontsize(width,height,
                                                             unitCol1.wC,unitCol1.hC);
                        }
                    }
                }
            }
        }
    }
}
