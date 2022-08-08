import QtQuick 2.9
import com.Najafian.PadMode 1.0

Item {
    id:root
    property string color: "Yellow"
    property int mode: PadMode.Toggle
    readonly property int margin: 5
    readonly property string title: "Stop \n conditions"
    readonly property int imgSel0: 4;
    readonly property int imgSel1: 1;

    property bool timeLimEnabled: false
    property bool energyLimEnabled: false
    property bool powerLimEnabled: false
    property bool voltageLimEnabled: false
    property bool currentLimEnabled: false
    property bool unLockAll: true


    signal sendChange(string msg);
    function resetAll(){
        timeLimBtn.unSelect();
        energyLimBtn.unSelect();
        pwrLimBtn.unSelect();
        voltLimBtn.unSelect();
        currentLimBtn.unSelect();
    }

    Rectangle{
        id:rectparent
        property int w1:(width-2*margin)
        property int h1: (height -7*margin)/6
        anchors.fill: parent;
        radius: 5


        border.width:1
        border.color: "Black"
        color: parent.color;
        Column{
            anchors.fill: parent
            spacing: root.margin
            anchors.margins: spacing
            Rectangle{
                color: "orange"
                height: 40
                width: parent.width
                radius: 3;
                Text{
                    anchors.fill: parent;
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text:root.title;
                    font.pointSize: parent.height*0.3
                }
            }
            Pad{
                id: timeLimBtn
                height: rectparent.h1;  width: rectparent.w1
                bText: "Time"
                mode:root.mode
                firstImgSelect: root.imgSel0
                secoundImgSelect: root.imgSel1
                enabled:  root.timeLimEnabled;
                active: unLockAll
                onPressed: {
                    sendChange(bText);
                }

            }
            Pad{
                id:energyLimBtn
                height: rectparent.h1;  width: rectparent.w1
                bText: "Energy"
                mode:root.mode
                firstImgSelect: root.imgSel0
                secoundImgSelect: root.imgSel1
                enabled: root.energyLimEnabled
                active: unLockAll
                onPressed: {
                    sendChange(bText);
                }
            }
            Pad{
                id:pwrLimBtn
                height: rectparent.h1;   width:  rectparent.w1
                bText: "Power"
                mode:root.mode
                firstImgSelect: root.imgSel0
                secoundImgSelect: root.imgSel1
                enabled: root.powerLimEnabled
                active: unLockAll
                onPressed: {
                    sendChange(bText);
                }
            }
            Pad{
                id:voltLimBtn
                height: rectparent.h1;  width: rectparent.w1
                bText: "Voltage"
                mode:root.mode
                firstImgSelect: root.imgSel0
                secoundImgSelect: root.imgSel1
                enabled: root.voltageLimEnabled;
                active: unLockAll
                onPressed: {
                    sendChange(bText);
                }
            }
            Pad{
                id:currentLimBtn
                height: rectparent.h1;  width: rectparent.w1
                bText: "Current"
                mode:root.mode
                firstImgSelect: root.imgSel0
                secoundImgSelect: root.imgSel1
                enabled: root.currentLimEnabled;
                active: unLockAll
                onPressed: {
                    sendChange(bText);
                }
            }
        }

    }
}
