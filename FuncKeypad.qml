import QtQuick 2.0
import com.Najafian.PadMode 1.0
import "qrc:/Keypad/Pad"

Item {
    id:root
    signal send(string msg);
    function calcFontSize(w,h,wC,hC){
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
        id:rect
        anchors.fill: parent
        Column{
            anchors.fill: parent
            property int w1:width

            property int h1: w1/2;

            spacing: (height-h1*6)/6;

            property int mode: PadMode.Simple

            Pad{
                visible: false
            }

            Row{
                height: parent.h1
                width: parent.width
                Pad{
                    id:menuOffBtn
                    width:parent.height*0.5
                    mode: parent.parent.mode
                    height:width
                    firstImgSelect: 0;
                    bText:""
                    onPressed:root.send("MenuOff")
                }
                Rectangle{
                    height: menuOffBtn.height
                    width: parent.width-menuOffBtn.width-parent.spacing
                    Text{
                       anchors.fill: parent
                       text:"Menu\noff"
                       font.family: "MS Serif"
                       onWidthChanged: {
                           font.pointSize=calcFontSize(width,height,0.5,0.5);
                       }

                       font.pointSize: calcFontSize(width,height,0.3,0.5);
                       verticalAlignment: Text.AlignVCenter
                       horizontalAlignment: Text.AlignHCenter
                   }
                }
            }

            Pad{
                width: parent.w1
                mode: parent.mode
                height:parent.h1
                firstImgSelect: 0;
                bText:""
                onPressed:root.send("F1")
            }
            Pad{
                width: parent.w1
                mode: parent.mode
                height:parent.h1
                firstImgSelect: 0;
                bText:""
                onPressed:root.send("F2")
            }
            Pad{
                width: parent.w1
                mode: parent.mode
                height:parent.h1
                firstImgSelect: 0;
                bText:""
                onPressed:root.send("F3")
            }
            Pad{
                width: parent.w1
                mode: parent.mode
                height:parent.h1
                firstImgSelect: 0;
                bText:""
                onPressed:root.send("F4")
            }
            Pad{
                width: parent.w1
                mode: parent.mode
                height:parent.h1
                firstImgSelect: 0;
                bText:""
                onPressed:root.send("F5")
            }
        }
    }
}
