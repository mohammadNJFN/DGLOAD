import QtQuick 2.9
import com.Najafian.PadMode 1.0
import "qrc:/Keypad/Pad"
Item {
    id:root
    readonly property int bMargin: ((height/22)<(width/26))?(height/22):(width/26)
    property color bColor: "White"
    property bool unLockAll: true

    property int numMode:  PadMode.OneShot;
    property int  ctrlMode: PadMode.OneShot;
    property int w1: (width-4*bMargin)/4
    property int h1: (height-4*bMargin)/4
    readonly property double generalHFTC: 0.4
    readonly property double generalWFTC: 0.3

    signal send(string msg);
    Rectangle{
        id:rect;
        radius: 5
        property int margin: bMargin;
        color: bColor
        anchors.fill:root;

        border.width: 1
        border.color: "Black"
        Grid{
            id:grid1
            anchors.fill:parent
           columns: 4
           rows:4
           spacing: parent.margin
           topPadding: spacing/2
           leftPadding: topPadding
           ////////////////////////////////////////Row 1 \/ \/
           Pad{
               id:num7Btn
               bText: "7\nabc"; width: root.w1; height: root.h1
               mode:numMode
               active: unLockAll
               hFTC: root.generalHFTC
               wFTC: root.generalWFTC
               onPressed: {
                   root.send(bText);
               }
           }
           Pad{
               id:num8Btn
               bText: "8\ndef"; width: root.w1; height: root.h1
               mode:numMode
               active: unLockAll
               hFTC: root.generalHFTC
               wFTC: root.generalWFTC
               onPressed: {
                   root.send(bText);
               }
           }
           Pad{
               id:num9Btn
               bText: "9\nghi"; width: root.w1; height: root.h1
               mode:numMode
               active: unLockAll
               hFTC: root.generalHFTC
               wFTC: root.generalWFTC
               onPressed: {
                   root.send(bText);
               }
           }

           Pad{
             id:lckBtn
               bText: "Esc"; width: root.w1; height: root.h1
               mode:ctrlMode
               active: unLockAll
               hFTC: root.generalHFTC
               wFTC: root.generalWFTC
               onPressed: {
                   root.send(bText);
               }

           }
           ///////////////////////////////////// Row2 \/  \/
           Pad{
               id:num4Btn
               bText: "4\njkl"; width: root.w1; height: root.h1
               mode:numMode
               active: unLockAll
               hFTC: root.generalHFTC
               wFTC: root.generalWFTC
               onPressed: {
                   root.send(bText);
               }
            }
           Pad{
               id:num5Btn
               bText: "5\nmno"; width: root.w1; height: root.h1
               mode:numMode
               active: unLockAll
               hFTC: root.generalHFTC
               wFTC: root.generalWFTC
               onPressed: {
                   root.send(bText);
               }
           }
           Pad{
               id:num6Btn
               bText: "6\npqr"; width: root.w1; height: root.h1
               mode:numMode
               active: unLockAll
               hFTC: root.generalHFTC
               wFTC: root.generalWFTC
               onPressed: {
                   root.send(bText);
               }
           }
           Pad{
               id:numleftBtn
               bText: "Left"; width: root.w1; height: root.h1
               mode:ctrlMode
               active: unLockAll
               hFTC: root.generalHFTC
               wFTC: root.generalWFTC
               onPressed: {
                   root.send(bText);
               }
           }
           ///////////////////////////////////// Row3 \/  \/
           Pad{
               id:num1Btn
               bText: "1\nstu"; width: root.w1; height: root.h1
               mode:numMode
               active: unLockAll
               hFTC: root.generalHFTC
               wFTC: root.generalWFTC
               onPressed: {
                   root.send(bText);
               }
           }
           Pad{
               id:num2Btn
               bText: "2\nwx"; width: root.w1; height: root.h1
               mode:numMode
               active: unLockAll
               hFTC: root.generalHFTC
               wFTC: root.generalWFTC
               onPressed: {
                   root.send(bText);
               }
           }
           Pad{
               id:num3Btn
               bText: "3\nyz"; width: root.w1; height: root.h1
               mode:numMode
               active: unLockAll
               hFTC: root.generalHFTC
               wFTC: root.generalWFTC
               onPressed: {
                   root.send(bText);
               }
           }
           Pad{
               id:numrightBtn
               bText: "Right"; width: root.w1; height: root.h1
               mode:ctrlMode
               active: unLockAll
               hFTC: root.generalHFTC
               wFTC: root.generalWFTC
               onPressed: {
                   root.send(bText);
               }
           }
           ///////////////////////////////////// Row4 \/  \/
           Pad{
               id:num0Btn
               bText: "0"; width: root.w1; height: root.h1
               mode:numMode
               active: unLockAll
               hFTC: root.generalHFTC
               wFTC: root.generalWFTC
               onPressed: {
                   root.send(bText);
               }
           }
           Pad{
               id:numPBtn
               bText: "."; width: root.w1; height: root.h1
               mode:numMode
               active: unLockAll
               hFTC: root.generalHFTC
               wFTC: root.generalWFTC
               onPressed: {
                   root.send(bText);
               }
           }

           Pad{
             id:bkSpcBtn
               bText: "<-"; width: root.w1; height: root.h1
               mode:ctrlMode
               active: unLockAll
               hFTC: root.generalHFTC
               wFTC: root.generalWFTC
               onPressed: {
                   root.send(bText);
               }
           }
           Pad{
               id:enterBtn
               bText: "Enter"; width: root.w1; height: root.h1
               mode:ctrlMode
               active: unLockAll
               hFTC: root.generalHFTC
               wFTC: root.generalWFTC
               onPressed: {
                   root.send(bText);
               }
           }
        }
    }
}
