import QtQuick 2.0
import com.Najafian.PadMode 1.0
Item {
    id:root
    signal send(string msg);
    Rectangle{
        id:rect
        anchors.fill: parent
        Column{
            anchors.fill: parent
            property int w1:width

            property int h1: w1/2;

            spacing: (height-h1*6)/6;

            property int mode: PadMode.Simple

            Rectangle{
                color: rect.color
                width: parent.w1
                height:parent.h1

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
