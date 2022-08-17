import QtQuick 2.0

Item {
    id:root
    property bool unLockAll: true
    Pad{
        height: 0
        width: 0
        visible: false
    }
    function resetAll(){
        ldSelect.reserAll();
        limSelect.resetAll();
        progselPanel.resetAll();
    }
    signal selectLoad(string loadname);
    Rectangle{
        width: root.width
        height: root.height
        Row{
            anchors.fill: parent
            spacing: 6
            LimitSelect{
                id:limSelect
                visible: true
                unLockAll: root.unLockAll
                x:50; y:0; width: parent.width/4; height: parent.height
            }
            Column{
                spacing: parent.spacing
                width: parent.width-limSelect.width
                height: parent.height
                LoadSelect{
                    id:ldSelect
                    visible: true
                    height: parent.height*1/3;
                    width: parent.width
                    unLockAll: root.unLockAll
                    onSendChange: {
                        root.selectLoad(msg);

                        if(ldSelect.resistanceIsSelect()){
                            limSelect.timeLimEnabled=true;
                            limSelect.energyLimEnabled=true;
                            limSelect.powerLimEnabled=true;
                            limSelect.currentLimEnabled=true;
                            limSelect.voltageLimEnabled=true;
                        }
                        else if(ldSelect.voltageIsSelect()){
                            limSelect.timeLimEnabled=true;
                            limSelect.energyLimEnabled=true;
                            limSelect.powerLimEnabled=true;
                            limSelect.currentLimEnabled=true;
                            limSelect.voltageLimEnabled=false;
                        }
                        else if(ldSelect.currentIsSelect()){
                            limSelect.timeLimEnabled=true;
                            limSelect.energyLimEnabled=true;
                            limSelect.powerLimEnabled=true;
                            limSelect.currentLimEnabled=false;
                            limSelect.voltageLimEnabled=true;
                        }
                        else if(ldSelect.powerIsSelect()){
                            limSelect.timeLimEnabled=true;
                            limSelect.energyLimEnabled=true;
                            limSelect.powerLimEnabled=false;
                            limSelect.currentLimEnabled=true;
                            limSelect.voltageLimEnabled=true;
                        }
                        else{
                            limSelect.timeLimEnabled=false;
                            limSelect.energyLimEnabled=false;
                            limSelect.powerLimEnabled=false;
                            limSelect.currentLimEnabled=false;
                            limSelect.voltageLimEnabled=false;
                        }
                    }
                }
                Numpad{
                    id:numpd
                    width: parent.width
                    height: parent.height-ldSelect.height
                    unLockAll: root.unLockAll
                    onSend: {
                        rcvtxt=msg;
                    }
                }
            }
            ProgSelect{
                id:progselPanel
                width: limSelect.width
                height: limSelect.height
                unLockAll: root.unLockAll
            }
        }

    }
}
