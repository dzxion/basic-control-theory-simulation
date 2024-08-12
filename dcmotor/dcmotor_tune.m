% close all
clear
clc

% For this example, the design requirements are:
% Rise time of less than 0.5 seconds
% Steady-state error of less than 5%
% Overshoot of less than 10%
% Gain margin greater than 20 dB
% Phase margin greater than 40 degrees

%% sl_dcmotor_pid
% mdl = "sl_dcmotor_pid";
% open_system(mdl)
% st0 = slTuner(mdl,["C1"]);
% addPoint(st0,["r","w","u","w_f","e"]);

% Req1 = TuningGoal.Tracking('r','w',0.5,0.05);
% Req2 = TuningGoal.Overshoot('r','w',10);
% Req3 = TuningGoal.Margins('e',20,40);
% [st,fSoft] = systune(st0,[Req1,Req2,Req3])

%% sl_dcmotor_cascade_pid
% mdl = "sl_dcmotor_cascade_pid";
% open_system(mdl)
% st0 = slTuner(mdl,["C1","C2"]);
% addPoint(st0,["r","w","u","w_f","e_w","i_f","e_i"]);

% Req1 = TuningGoal.Tracking('r','w',0.5,0.05);
% Req2 = TuningGoal.Overshoot('r','w',10);
% Req3 = TuningGoal.Margins('e_w',20,40);
% Req4 = TuningGoal.Margins('e_i',20,40);
% Req4.Openings = 'w_f';
% [st,fSoft] = systune(st0,[Req1,Req2,Req3,Req4])

%% sl_dcmotor_cascade_adrc_pid
mdl = "sl_dcmotor_cascade_adrc_pid";
open_system(mdl)
st0 = slTuner(mdl,["C1","C2","C3"]);
addPoint(st0,["r","w","u","w_f","e_w","i_f","e_i"]);

wc = realp('wc', 1);% controller bandwidth
b0 = realp('b0', 1);  
kp = 2*pi*wc;
setBlockParam(st0,'C1',kp);
setBlockParam(st0,'C3',1/b0);

Req1 = TuningGoal.Tracking('r','w',0.5,0.05);
Req2 = TuningGoal.Overshoot('r','w',10);
Req3 = TuningGoal.Margins('e_w',20,40);
Req4 = TuningGoal.Margins('e_i',20,40);
Req4.Openings = 'w_f';
[st,fSoft] = systune(st0,[Req1,Req2,Req3,Req4])

%% result
plant = getIOTransfer(st0,"u","w",{"w_f","i_f"});
tf(plant)

showTunable(st)

CL = getIOTransfer(st,"r","w");
tf(CL)
figure
stepplot(CL);

% OL = getIOTransfer(st,"r","w","w_f");
% tf(OL)
% figure
% bodeplot(OL)
% 
% margin(OL)
% 
% figure;
% viewGoal([Req3],st)
