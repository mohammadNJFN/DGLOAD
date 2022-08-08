import QtQuick 2.9
import com.Najafian.PadMode 1.0

Item {
    id:root
    property string color: "Yellow"
    property int mode: PadMode.Toggle
    property bool  unLockAll: true;
    readonly property int margin: 5
    readonly property double generalHFTC: 0.4
    readonly property double generalWFTC: 0.25
    function resistanceIsSelect(){
        return resTypeBtn.isSelect();
    }
    function voltageIsSelect(){
        return vltTypeBtn.isSelect();

    }
    function currentIsSelect(){
        return currTypeBtn.isSelect();

    }
    function powerIsSelect(){
        return pwrTypeBtn.isSelect();

    }
    function reserAll(){
        resTypeBtn.unSelect();
        vltTypeBtn.unSelect();
        currTypeBtn.unSelect();
        pwrTypeBtn.unSelect();
    }


    signal sendChange(string msg);

    Rectangle{
        id:rectparent
        property int w1:(width -5*margin)/4
        property int h1: (height-3*margin)/2
        anchors.fill: parent;
        radius: 5
        border.width:1
        border.color: "Black"
        color: parent.color;
        Column{
            id:clmn
            anchors.fill: parent
            spacing:  root.margin;
            anchors.margins: root.margin;
            Rectangle{
                color: "orange"
                height: 30
                width: parent.width
                radius: 3;
                Text{
                    anchors.fill: parent;
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text:"Type of load";
                    function calcFontSize(){
                        var t1=parent.height*root.generalHFTC;
                        var t2=parent.width*root.generalWFTC;
                        var fs=(t1<t2)?t1:t2;
                        return fs;
                    }
                    font.pixelSize: calcFontSize();
                }
            }
            Row{
                spacing: 3
                Pad{
                    id:resTypeBtn
                    height: rectparent.h1
                    width: rectparent.w1
                    bText: "Resist"
                    mode:root.mode
                    active: unLockAll
                    hFTC: root.generalHFTC
                    wFTC: root.generalWFTC
                    onPressed: {
                        pwrTypeBtn.unSelect();
                        currTypeBtn.unSelect();
                        vltTypeBtn.unSelect();
                        sendChange(bText);
                    }

                }
                Pad{
                    id: pwrTypeBtn
                    height: rectparent.h1
                    width: rectparent.w1
                    bText: "Power"
                    mode:root.mode
                    active: unLockAll
                    hFTC: root.generalHFTC
                    wFTC: root.generalWFTC
                    onPressed: {
                        resTypeBtn.unSelect();
                        currTypeBtn.unSelect();
                        vltTypeBtn.unSelect();
                        sendChange(bText);
                    }
                }
                Pad{
                    id:currTypeBtn
                    height: rectparent.h1
                    width:  rectparent.w1
                    bText: "Current"
                    mode:root.mode
                    active: unLockAll
                    hFTC: root.generalHFTC
                    wFTC: root.generalWFTC
                    onPressed: {
                        pwrTypeBtn.unSelect();
                        resTypeBtn.unSelect();
                        vltTypeBtn.unSelect();
                        sendChange(bText);
                    }
                }
                Pad{
                    id:vltTypeBtn
                    height: rectparent.h1
                    width: rectparent.w1
                    bText: "Voltage"
                    mode:root.mode
                    active: unLockAll
                    hFTC: root.generalHFTC
                    wFTC: root.generalWFTC
                    onPressed: {
                        pwrTypeBtn.unSelect();
                        currTypeBtn.unSelect();
                        resTypeBtn.unSelect();
                        sendChange(bText);
                    }
                }
            }
        }

    }


}
