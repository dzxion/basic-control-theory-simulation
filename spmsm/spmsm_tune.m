close all
clear
clc

% tuning using simulink
% mdl = "sl_spmsm";
% open_system(mdl)
% st0 = slTuner(mdl,["Iq controller","Id controller"])
% addPoint(st0,["Iq_ref_A","Id_ref_A","Iq_in_A","Id_in_A"]);
% 
% Req1 = TuningGoal.Tracking('Iq_ref_A','Iq_in_A',0.5,0.05);
% Req2 = TuningGoal.Tracking('Id_ref_A','Id_in_A',0.5,0.05);
% 
% [st,fSoft] = systune(st0,[Req1,Req2])

% tuning using matlab
Ls_q_H = 2.39e-3;
Ls_d_H = 2.10e-3;
Rs_Ohm = 5.2;
G_iq = tf(1,[Ls_q_H Rs_Ohm]);

Kp_Iq = realp('Kp_Iq',1);
Ki_Iq = realp('Ki_Iq',1);
C_Iq = tf([Kp_Iq Kp_Iq*Ki_Iq],[1 0]);

AP = AnalysisPoint('u');

CL_Iq = feedback(C_Iq*AP*G_iq,1);  % closed-loop transfer from r to y
CL_Iq.InputName = 'r';
CL_Iq.OutputName = 'y';

Req1 = TuningGoal.Tracking('r','y',0.001);

[T_Iq,fSoft] = systune(CL_Iq,[Req1]);

showTunable(T_Iq)  % tuned values of all tunable elements

figure
viewGoal([Req1],T_Iq)

figure
step(T_Iq)

L_Iq = getLoopTransfer(T_Iq,'u');
figure
bode(L_Iq), grid
title('Open-loop response')

