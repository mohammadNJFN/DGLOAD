import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Particles 2.0
import QtMultimedia 5.9

import com.Najafian.PadMode 1.0

Item {
    id:root

    property int mode: PadMode.Simple;
    property int bImgSelect:firstImgSelect
    property string bText: "text"
    property bool activeBeep: true
    property bool warning: false
    property bool active:  true

    property int firstImgSelect: 4
    property int secoundImgSelect: 1
    property int fontSize: 0
    property double hFTC: 0
    property double wFTC: 0
    readonly property int warnImgSel: 2
    readonly property string imgSrc1: "Images/p1.png"
    readonly property string imgSrc2: "Images/p2.png"
    readonly property string imgSrc3: "Images/p3.png"
    readonly property string imgSrc4: "Images/p4.png"
    readonly property string imgSrc5: "Images/p5.png"
    readonly property string imgSrc6: "Images/p6.png"
    readonly property int    bDelay : 100


    x:0; y:0; z:2; height: 50;  width: 100
    signal pressed();
    signal hold();
    function  isSelect(){
        return rect.isSelect;
    }
    function  unSelect(){
        if(root.warning===false){
            if(mode===PadMode.Toggle){
                if(enabled)
                    rect.bImgSelect=firstImgSelect;
            }
            console.debug("unSelect: ",root.bText);
            rect.isSelect=false;
        }
        else{
            console.debug("active warning: ",root.bText);
        }
    }
    function warningOn(){

        if(root.enabled){
            warning=true;
            rect.bImgSelect=2;
        }
    }
    function warningOff(){
        if(warning){
            warning=false;
            checkEnable();
        }
    }

    function checkEnable(){

        if(root.enabled===false){
            rect.bImgSelect=0;
        }
        else{
            switch(root.mode){
            case PadMode.Simple:
                rect.bImgSelect=firstImgSelect
                break;
            case PadMode.Controled:
                rect.bImgSelect=root.bImgSelect;
                break;
            case PadMode.OneShot:
                rect.bImgSelect=firstImgSelect
                break;
            case PadMode.Toggle:
                if(root.isSelect()){
                    rect.bImgSelect=secoundImgSelect
                }
                else{
                    rect.bImgSelect=firstImgSelect
                }
                break;
            }
        }
    }

    onEnabledChanged: {
        checkEnable();
    }


    onBImgSelectChanged: {
        if(mode===PadMode.Controled){
            rect.bImgSelect=bImgSelect;
        }
    }
    function calcFontsize(){
        var fs;

        if(root.fontSize===0 && root.hFTC===0 && root.wFTC===0){
            var l1=3*(txt1.width)/txt1.text.length;
            var l2=txt1.height*0.2;
           fs=(l1<l2) ?l1:l2;
        }

        else if(root.fontSize!==0){
            fs=root.fontSize;
        }
        else{
            if(root.hFTC===0)
                root.hFTC=root.wFTC
            else if(root.wFTC===0)
                root.wFTC=root.hFTC
            var t1=root.height*root.hFTC
            var t2=root.width*root.wFTC
            fs=(t1<t2)?t1:t2;
        }
        return fs;
    }

    Rectangle{
        id:rect;
        property string bImageSource: parent.imgSrc1
        property int mode: parent.mode
        property string bText: parent.bText
        property int bImgSelect:0;
        property bool isSelect: false
        anchors.fill:parent
        Component.onCompleted: {
            checkEnable();
        }
        Text {
            id: txt1
            text: parent.bText;
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignVCenter;
            z:2;
            font.pixelSize: root.calcFontsize();
        }
        MouseArea{
            anchors.fill:parent

            onPressAndHold: {
                if(active)
                    root.hold();
            }

            onPressed:{
                console.debug("w=",rect.width," , h=",rect.height)
                if(active){
                    if(root.warning===false){
                        if(activeBeep){
                            playBeep.play();
                        }
                        if(mode!==PadMode.Controled  ){
                            switch(mode){
                            case PadMode.Toggle:
                                if(parent.isSelect)
                                    parent.isSelect=false;
                                else
                                    parent.isSelect=true;
                                break;
                            case PadMode.OneShot:
                                parent.bImgSelect=secoundImgSelect;
                                tim1.start();
                                break;
                            }
                        }
                        root.pressed();
                        //padc.setQmlClick(true);
                    }
                    else{
                        console.debug(root.bText,"Btn pressed: warning  ")
                    }
                }
            }
        }

        Timer{
            id: tim1
            interval: bDelay
            onTriggered: {
                parent.bImgSelect=firstImgSelect;
            }
        }
        SoundEffect{
            id:playBeep;
            source:"beep-07a.wav";
        }

        Image {
            id: img
            anchors.fill: parent
            source: parent.bImageSource
        }
        onIsSelectChanged: {
            if(isSelect){
                bImgSelect=root.secoundImgSelect;
            }
            else{
                bImgSelect=root.firstImgSelect;
            }
        }

        onBImgSelectChanged: {
            switch(bImgSelect){
                case 0:
                    bImageSource=imgSrc1;
                    break;
                case 1:
                    bImageSource=imgSrc2;
                    break;
                case 2:
                    bImageSource=imgSrc3;
                    break;
                case 3:
                    bImageSource=imgSrc4;
                    break;
                case 4:
                    bImageSource=imgSrc5;
                    break;
                case 5:
                    bImageSource=imgSrc6;
                    break;
             }
        }
    }
    onModeChanged: {
        rect.bImageSource=imgSrc1;
    }
}
