import QtQuick 2.9
import com.Najafian.PadMode 1.0

Item {
    id:root
    property string color: "Yellow"
    property int mode: PadMode.Toggle
    readonly property int margin: 5
    readonly property string title: "Programm"
    readonly property int imgSel0: 4;
    readonly property int imgSel1: 1;
    readonly property double generalHFTC: 0.4
    readonly property double generalWFTC: 0.2

    property bool programmBtnEnabled: true
    property bool loadBtnEnabled: false
    property bool saveBtnEnabled: false
    property bool editBtnEnabled: false
    property bool upBtnEnabled: false
    property bool unLockAll: true

    signal sendChange(string msg);
    function resetAll(){
        progBtn.unSelect();
        loadBtn.unSelect();
        saveBtn.unSelect();
        editBtn.unSelect();
    }

    Rectangle{
        id:rectparent
        property int w1:(width-2*margin)
        property int h1: (height -8*margin)/7
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
                height: 30
                width: parent.width
                radius: 3;
                Text{
                    anchors.fill: parent;
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text:root.title;
                    function calcFontSize(){
                        var t1=parent.height*root.generalHFTC;
                        var t2=parent.width*root.generalWFTC;
                        var fs=(t1<t2)?t1:t2;
                        return fs;
                    }
                    font.pixelSize: calcFontSize();
                }
            }
            Pad{
                id: progBtn
                height: rectparent.h1;  width: rectparent.w1
                bText: "Programm"
                mode:root.mode
                firstImgSelect: root.imgSel0
                secoundImgSelect: root.imgSel1
                enabled:  root.programmBtnEnabled
                active: unLockAll
                hFTC: root.generalHFTC
                wFTC: root.generalWFTC
                onPressed: {
                    sendChange(bText);
                }
            }
            Pad{
                id:loadBtn
                height: rectparent.h1;  width: rectparent.w1
                bText: "Load"
                mode:root.mode
                firstImgSelect: root.imgSel0
                secoundImgSelect: root.imgSel1
                enabled: root.loadBtnEnabled
                active: unLockAll
                hFTC: root.generalHFTC
                wFTC: root.generalWFTC
                onPressed: {
                    sendChange(bText);
                }
            }
            Pad{
                id:saveBtn
                height: rectparent.h1;   width:  rectparent.w1
                bText: "Save"
                mode:root.mode
                firstImgSelect: root.imgSel0
                secoundImgSelect: root.imgSel1
                enabled: root.saveBtnEnabled
                active: unLockAll
                hFTC: root.generalHFTC
                wFTC: root.generalWFTC
                onPressed: {
                    sendChange(bText);
                }
            }
            Pad{
                id:editBtn
                height: rectparent.h1;  width: rectparent.w1
                bText: "Edit"
                mode:root.mode
                firstImgSelect: root.imgSel0
                secoundImgSelect: root.imgSel1
                enabled: root.editBtnEnabled
                active: unLockAll
                hFTC: root.generalHFTC
                wFTC: root.generalWFTC
                onPressed: {
                    sendChange(bText);
                }
            }
            Pad{
                id:upBtn
                height: rectparent.h1;  width: rectparent.w1
                bText: "Up"
                mode:root.mode
                firstImgSelect: root.imgSel0
                secoundImgSelect: root.imgSel1
                enabled: root.upBtnEnabled
                active: unLockAll
                hFTC: root.generalHFTC
                wFTC: root.generalWFTC
                onPressed: {
                    sendChange(bText);
                }
            }
            Pad{
                id:downBtn
                height: rectparent.h1;  width: rectparent.w1
                bText: "Down"
                mode:root.mode
                firstImgSelect: root.imgSel0
                secoundImgSelect: root.imgSel1
                enabled: root.upBtnEnabled
                active: unLockAll
                hFTC: root.generalHFTC
                wFTC: root.generalWFTC
                onPressed: {
                    sendChange(bText);
                }
            }
        }

    }
}
