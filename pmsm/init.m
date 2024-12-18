clear
clc

% plant
pa.J = 0.1;
pa.B = 0.0001;
pa.Lms = 300e-6; % gap crossing inductance
pa.Lls = 10e-6;% leakage inductance
pa.Ldelta = 20e-6;
Ls = 3/2*pa.Lms + pa.Lls;
pa.Ld = Ls - 3/2*pa.Ldelta;
pa.Lq = Ls + 3/2*pa.Ldelta;
pa.phi_m = 0.6;
pa.P = 6;
pa.R = 20e-3;
pa.dc = 24;
pa.CarrFreq = 10;

% pa.Lq = 2.39e-3;
% pa.Ld = 2.10e-3;
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