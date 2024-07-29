close all
clear
clc

mdl = "sl_dcmotor";
open_system(mdl)
st0 = slTuner(mdl,["C1"]);
addPoint(st0,["r","w","u","w_f","e"]);
plant = getIOTransfer(st0,"u","w","w_f");
tf(plant)

Req1 = TuningGoal.Tracking('r','w',0.5,0.05);
Req2 = TuningGoal.Overshoot('r','w',10);
Req3 = TuningGoal.Margins('e',20,40);
% [st,fSoft] = systune(st0,[Req1,Req2])
[st,fSoft] = systune(st0,[Req1,Req2,Req3])
getBlockValue(st,'C1')  % tuned value of PI controller

CL = getIOTransfer(st,"r","w");
tf(CL)
figure
stepplot(CL);

OL = getIOTransfer(st,"r","w","w_f");
tf(OL)
figure
bodeplot(OL)

margin(OL)

figure;
viewGoal([Req3],st)
