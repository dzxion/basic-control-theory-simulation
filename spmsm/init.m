% clear
% clc

% plant
pa.J = 0.02;
pa.B = 0.2;
pa.Lq = 2.39e-3;
pa.Ld = 2.10e-3;
pa.phi_m = 0.00469;
pa.P = 14;
pa.R = 5.2;
% pa.Kf = 0.2;
% pa.Km = .015;
% pa.Kb = .015;

% controller
% pa.BWc_rps = 100;
% pa.CarrFreq = 20;
% currentCtrlPeriod_sec =  1.0 / (pa.CarrFreq * 1000);
% pa.Kp_Iq = pa.BWc_rps*pa.Ls_q_H;
% pa.Ki_Iq = pa.Rs_Ohm/pa.Ls_q_H;
% pa.Kp_Id = pa.BWc_rps*pa.Ls_d_H;
% pa.Ki_Id = pa.Rs_Ohm/pa.Ls_d_H;

% pa.Kp_Id = 1;
% pa.Ki_Id = 1;
% 
% pa.Kp_Iq = 1;
% pa.Ki_Iq = 1;