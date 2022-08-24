import QtQuick 2.9

Item {
    id:root

    property string color: "white"
    property string curveColor: "Black"
    property string textColor: "Black"
    property string  axisColor: "Black"
    property string gridColor: "Black"
    property int curveWidth: 3
    property bool gridOn:true
    property int offsetX: 20
    property int offsetY: -25
    property point resizeFactor:Qt.point(1.0,0.98)
    function addPoint(y){
        curveWindow.addPoint(y);
    }

    function showCurve(){
        templateCanvas.showCurve();
        templateCanvas.requestPaint();

    }
    function resetCurve(){
        curveWindow.reset();
        showCurve();
    }
    function autoScaleCurve(){
        curveWindow.autoScale();
    }

    Rectangle{
        property int hSpace: width/40
        property int vSpace: height/40
        anchors.fill: parent
        color:root.color
        property int canvasW: width - hSpace * 1.5
        property int canvasH: height - vSpace*1.5


        Canvas{
            id:templateCanvas
            width: parent.canvasW
            height: parent.canvasH
            property bool curveShowRequestFlag: false;
            x:parent.hSpace
            y:parent.vSpace
            property int vGridSpace:width/10
            property int hGridSpace:height/10
            property double vGridValue: 1.0
            property double hGridValue: 1.0

            contextType: "2d"

            Path{
                id: axis
                startX: templateCanvas.x;  startY: templateCanvas.y
                PathLine{x:templateCanvas.x;  y:templateCanvas.height}
                PathLine{x:templateCanvas.width;  y:templateCanvas.height}

            }
            Path{
                id:hLine
                property double sY: 0
                startX: templateCanvas.x;
                startY: sY
                PathLine{
                    x:templateCanvas.width;
                    y:hLine.sY;
                }

            }
            Path{
                id:vLine
                property double sX: 0
                startY: templateCanvas.x;
                startX: sX
                PathLine{
                    y:templateCanvas.height;
                    x:vLine.sX;
                }
            }
            function showGrid(){
               // context.setLineDash([2,1]);
                context.lineWidth =1
                context.strokeStyle=root.gridColor
                var i;
                hLine.sY=0

                for(i=1;i<10;i++){
                    hLine.sY+=hGridSpace
                    context.path=hLine
                    context.stroke();
                }
                vLine.sX=templateCanvas.x;
                for(i=1;i<10;i++){
                    vLine.sX+=vGridSpace
                    context.path=vLine
                    context.stroke();
                }
            }

            Path{
                id: curveWindow
                property int width: parent.width*root.resizeFactor.x
                property int height: parent.height*root.resizeFactor.y
                property int lastWidth: 0
                property int lastHeight: 0
                property int offsetX: root.offsetX
                property int offsetY: root.offsetY
                PathLine{id:cp1}
                PathLine{id:cp2}
                PathLine{id:cp3}
                PathLine{id:cp4}
                PathLine{id:cp5}
                PathLine{id:cp6}
                PathLine{id:cp7}
                PathLine{id:cp8}
                PathLine{id:cp9}
                PathLine{id:cp10}
                PathLine{id:cp11}
                PathLine{id:cp12}
                PathLine{id:cp13}
                PathLine{id:cp14}
                PathLine{id:cp15}
                PathLine{id:cp16}
                PathLine{id:cp17}
                PathLine{id:cp18}
                PathLine{id:cp19}
                PathLine{id:cp20}

                property int indx: 0
                function addPoint(y){
                    indx%=21
                    var x=indx;
                    var h=(1-y/100)*height+offsetY;
                    var w=(x/20)*width+offsetX;
                    switch(indx){
                    case 0:
                        startY=h; startX=w;
                    break;
                    case 1:
                        cp1.y=h;  cp1.x=w;
                    break;
                    case 2:
                        cp2.y=h;  cp2.x=w;
                    break;
                    case 3:
                        cp3.y=h;  cp3.x=w;
                    break;
                    case 4:
                        cp4.y=h;  cp4.x=w;
                    break;
                    case 5:
                        cp5.y=h;  cp5.x=w;
                    break;
                    case 6:
                        cp6.y=h;  cp6.x=w;
                    break;
                    case 7:
                        cp7.y=h;  cp7.x=w;
                    break;
                    case 8:
                        cp8.y=h;  cp8.x=w;
                    break;
                    case 9:
                        cp9.y=h;  cp9.x=w;
                    break;
                    case 10:
                        cp10.y=h;  cp10.x=w;
                    break;
                    case 11:
                        cp11.y=h;  cp11.x=w;
                    break;
                    case 12:
                        cp12.y=h;  cp12.x=w;
                    break;
                    case 13:
                        cp13.y=h;  cp13.x=w;
                    break;
                    case 14:
                        cp14.y=h;  cp14.x=w;
                    break;
                    case 15:
                        cp15.y=h;  cp15.x=w;
                    break;
                    case 16:
                        cp16.y=h;  cp16.x=w;
                    break;
                    case 17:
                        cp17.y=h;  cp17.x=w;
                    break;
                    case 18:
                        cp18.y=h;  cp18.x=w;
                    break;
                    case 19:
                        cp19.y=h;  cp19.x=w;
                    break;
                    case 20:
                        cp20.y=h;  cp20.x=w;
                    break;
                    }
                    indx++;
                }
                function reset(){
                    indx=0;
                    for(var i=0;i<=20;i++){
                        addPoint(10);
                    }
                }
                function updateLastDem(){
                    if(height===0 || width===0)
                        return;
                    lastHeight=height;
                    lastWidth=width;
                }
                function autoScale(){
                    if(lastHeight===0 || lastHeight===0)
                        return;
                    if(height===0 || width===0)
                        return;
                    var tH=height/lastHeight
                    var tW=width/lastWidth

                    startY=startY*tH; startX=startX*tW;
                    cp1.x=cp1.x*tW;  cp1.y=cp1.y*tH;
                    cp2.x=cp2.x*tW;  cp2.y=cp2.y*tH;
                    cp3.x=cp3.x*tW;  cp3.y=cp3.y*tH;
                    cp4.x=cp4.x*tW;  cp4.y=cp4.y*tH;
                    cp5.x=cp5.x*tW;  cp5.y=cp5.y*tH;
                    cp6.x=cp6.x*tW;  cp6.y=cp6.y*tH;
                    cp7.x=cp7.x*tW;  cp7.y=cp7.y*tH;
                    cp8.x=cp8.x*tW;  cp8.y=cp8.y*tH;
                    cp9.x=cp9.x*tW;  cp9.y=cp9.y*tH;
                    cp10.x=cp10.x*tW;  cp10.y=cp10.y*tH;
                    cp11.x=cp11.x*tW;  cp11.y=cp11.y*tH;
                    cp12.x=cp12.x*tW;  cp12.y=cp12.y*tH;
                    cp13.x=cp13.x*tW;  cp13.y=cp13.y*tH;
                    cp14.x=cp14.x*tW;  cp14.y=cp14.y*tH;
                    cp15.x=cp15.x*tW;  cp15.y=cp15.y*tH;
                    cp16.x=cp16.x*tW;  cp16.y=cp16.y*tH;
                    cp17.x=cp17.x*tW;  cp17.y=cp17.y*tH;
                    cp18.x=cp18.x*tW;  cp18.y=cp18.y*tH;
                    cp19.x=cp19.x*tW;  cp19.y=cp19.y*tH;
                    cp20.x=cp20.x*tW;  cp20.y=cp20.y*tH;
                }

            }
            function showCurve(){
                curveWindow.updateLastDem();
                curveShowRequestFlag=true;
            }

            onPaint: {

              //  context.setLineDash([1,0]);
                context.lineWidth =root.curveWidth
                context.strokeStyle=root.axisColor
                context.path = axis;
                context.stroke();
                showGrid();
                if(curveShowRequestFlag){
                //    context.setLineDash([1,0]);
                    context.lineWidth =root.curveWidth
                    context.strokeStyle =root.curveColor
                    context.path = curveWindow;
                    context.stroke();
                    curveShowRequestFlag=false
                }
            }
        }
    }
}
