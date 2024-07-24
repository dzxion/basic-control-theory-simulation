close all
clear
clc

R= 2.0; % Ohms
L= 0.5; % Henrys
Km = .015; % torque constant
Kb = .015; % emf constant
Kf = 0.2; % Nms
J= 0.02; % kg.m^2

A = [-Kf/J Km/J; -Kb/L -R/L];
B = [0; 1/L];
C = [1 0];
D = [0];
sys_dc = ss(A,B,C,D);
sys_tf = tf(sys_dc)
% eig(A)
% 
% Kp = 100;
% Ki = 10;
% A_e_p = [-Kf/J Km/J; -Kb/L-Kp/L -R/L];
% eig(A_e_p)
% A_e_pi = [-Kf/J Km/J 0;-Kb/L-Kp/L -R/L -Ki;1 0 0];
% eig(A_e_pi)

