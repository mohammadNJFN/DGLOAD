import QtQuick 2.0

Item {
    id:root
    Rectangle{
        id:mainRect
        x:root.x;   y:root.y;
        height: root.height
        width: root.width
        color: "#F0F0F0"
        border.width: 1
        border.color: "black"
        radius:5
        Row{
            height:parent.height
            width: parent.width
            spacing: 10

            Column{
                id:displayColumn
                height: parent.height-2*parent.spacing
                width: parent.width-menuRect.width-2*parent.spacing
                x:5; y:5
                spacing: 5

                Row{
                    id:headerRow;
                    Rectangle{
                        width: displayColumn.width
                        height: displayColumn.height*0.1
                        color: "orange"
                    }
                }
                Rectangle{
                    id:disp
                    color:"green"
                    height: parent.height*0.8
                    width: parent.width
                    Canvas{
                        id:cnvs

                        anchors.fill: parent
                        onPaint: {
                            // get context to draw with
                            var ctx = getContext("2d")
                            // setup the stroke
                            ctx.lineWidth = 4
                            ctx.strokeStyle = "blue"
                            // setup the fill
                            ctx.fillStyle = "steelblue"
                            // begin a new path to draw
                            ctx.beginPath()
                            // top-left start point
                            ctx.moveTo(50,50)
                            // upper line
                            ctx.lineTo(150,50)
                            // right line
                            ctx.lineTo(150,150)
                            // bottom line
                            ctx.lineTo(50,150)
                            // left line through path closing
                            ctx.closePath()
                            // fill using fill style
                            ctx.fill()
                            // stroke using line width and stroke style
                            ctx.stroke()
                        }
                    }
                }
                Row{
                    id:footerRow;
                    Rectangle{
                        width: displayColumn.width
                        height: displayColumn.height*0.1
                        color: "orange"
                    }
                }
            }

            Rectangle{
                id: menuRect
                y:10
                height: parent.height-2*parent.spacing
                width: fixedWidth
                property  int fixedWidth: parent.width*0.1-parent.spacing
                color:"blue"

            }
        }

    }
}
