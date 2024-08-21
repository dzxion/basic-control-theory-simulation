close all
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

% % writeBlockValue(st);
% showTunable(st)
% 
% plant = getIOTransfer(st0,"u","p",{"w_f"})
% tf(plant)
% 
% CL = getIOTransfer(st,"r","w")
% tf(CL)
% figure
% stepplot(CL);

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

% % writeBlockValue(st);
% showTunable(st)
% 
% plant = getIOTransfer(st0,"u","w",{"w_f","i_f"})
% tf(plant)
% 
% CL = getIOTransfer(st,"r","w")
% tf(CL)
% figure
% stepplot(CL);

%% sl_dcmotor_cascade_adrc_pid
% mdl = "sl_dcmotor_cascade_adrc_pid";
% open_system(mdl)
% st0 = slTuner(mdl,["C1","C2","C3","C4","C5","C6"]);
% addPoint(st0,["r","w","u","w_f","e_w","i_f","e_i","z1"]);
% 
% wc = realp('wc', 1);% controller bandwidth
% wo = realp('wo', 1);% observer bandwidth
% b0 = realp('b0', 1);  
% kp = 2*pi*wc;
% L1 = 2*wo;
% L2 = wo*wo;
% setBlockParam(st0,'C1',kp);
% setBlockParam(st0,'C3',1/b0);
% setBlockParam(st0,'C4',L1);
% setBlockParam(st0,'C5',L2);
% setBlockParam(st0,'C6',b0);
% 
% Req1 = TuningGoal.Tracking('r','w',0.5,0.05);
% Req2 = TuningGoal.Overshoot('r','w',10);
% Req3 = TuningGoal.Margins('e_w',20,40);
% Req4 = TuningGoal.Margins('e_i',20,40);
% Req4.Openings = 'w_f';
% [st,fSoft] = systune(st0,[Req1,Req2,Req3,Req4])
% 
% % writeBlockValue(st);
% showTunable(st)
% 
% plant = getIOTransfer(st0,"u","w",{"w_f","i_f"})
% tf(plant)
% 
% CL = getIOTransfer(st,"r","w")
% tf(CL)
% figure
% stepplot(CL);
% 
% CL_ESO = getIOTransfer(st,"w_f","z1")
% tf(CL_ESO)

%% sl_dcmotor_cascade_pid_kalman (do not use kalman feedback)
% mdl = "sl_dcmotor_cascade_pid_kalman";
% open_system(mdl)
% st0 = slTuner(mdl,["C1","C2"]);
% addPoint(st0,["r","p","u","w_f","e_w","p_f","e_p"]);
% 
% Req1 = TuningGoal.Tracking('r','p',0.5,0.05);
% Req2 = TuningGoal.Overshoot('r','p',10);
% Req3 = TuningGoal.Margins('e_w',20,40);
% Req4 = TuningGoal.Margins('e_p',20,40);
% Req3.Openings = 'p_f';
% [st,fSoft] = systune(st0,[Req1,Req2,Req3,Req4])

% % writeBlockValue(st);
% showTunable(st)
% 
% plant = getIOTransfer(st0,"u","p",{"w_f","p_f"})
% tf(plant)
% 
% CL = getIOTransfer(st,"r","p")
% tf(CL)
% figure
% stepplot(CL);

%% sl_dcmotor_cascade_pid_kalman (use kalman feedback)
mdl = "sl_dcmotor_cascade_pid_kalman";
open_system(mdl)
st0 = slTuner(mdl,["C1","C2","K1","K2","K3"]);
addPoint(st0,["r","p","u","w_f","e_w","p_f","e_p","p_hat"]);

U = realp('U', 1);% matrix U
Q = realp('Q', 1);% matrix Q
setBlockParam(st0,'K1',U);
setBlockParam(st0,'K2',Q);
setBlockParam(st0,'K3',Q);

Req1 = TuningGoal.Tracking('r','p',0.5,0.05);
Req2 = TuningGoal.Overshoot('r','p',10);
Req3 = TuningGoal.Margins('e_w',20,40);
Req4 = TuningGoal.Margins('e_p',20,40);
Req3.Openings = 'p_f';
[st,fSoft] = systune(st0,[Req1,Req2,Req3,Req4])

% writeBlockValue(st);
showTunable(st)

plant = getIOTransfer(st0,"u","p",{"w_f","p_f"})
tf(plant)

CL = getIOTransfer(st,"r","p")
tf(CL)
figure
stepplot(CL);

CL_KF = getIOTransfer(st,"p_f","p_hat")
tf(CL_KF)
