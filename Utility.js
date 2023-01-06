
var  bigOmega="\u03A9"
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
