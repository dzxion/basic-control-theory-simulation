% clear
% clc

% plant
pa.Ls_q_H = 2.39e-3;
pa.Ls_d_H = 2.10e-3;
pa.Rs_Ohm = 5.2;
pa.J = 0.02;
pa.Kf = 0.2;
pa.Km = .015;
pa.Kb = .015;

% controller
pa.BWc_rps = 4000;
pa.CarrFreq = 20;
currentCtrlPeriod_sec =  1.0 / (pa.CarrFreq * 1000);
% pa.Kp_Id = pa.Ls_d_H * BWc_rps;
% pa.Ki_Id = 0.8*RdoverLd_rps*;

pa.Kp_Id = 1;
pa.Ki_Id = 1;

pa.Kp_Iq = 1;
pa.Ki_Iq = 1;