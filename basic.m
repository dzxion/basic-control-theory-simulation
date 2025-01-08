close all
clear
clc

%% some function
% syms s1
% fplot(@(x) sin(x))
% hold on
% theta = deg2rad(60)
% fplot(@(x) sin(x-theta))
% R = 5.2;L = 2.39e-3;
% K1 = 100*L;K2 = K1*R/L;
% fplot(@(t) exp(-(t*(K1 + R))/(2*L))*(cosh((t*(K1^2 + 2*K1*R + R^2 - 4*K2*L)^(1/2))/(2*L)) - (sinh((t*(K1^2 + 2*K1*R + R^2 - 4*K2*L)^(1/2))/(2*L))*(K1 + R))/(K1^2 + 2*K1*R + R^2 - 4*K2*L)^(1/2)))

% 
% atan2(1,0)

% fplot(@(x) 20*log10(x))
% f1 = @(x) 10*exp(-10*x);
% f2 = @(x) 1*exp(-10*x);
% fplot(@(x) 10*exp(-0*x))
% k = -0.5;
% x_init = 10;
% fplot(@(x) 10*exp(k*x),[0 10])
% hold on
% fplot(@(x) 5*exp(k*x),[0 10])
% hold on
% fplot(@(x) x_init*exp(k*x),[0 10])
% expand((s1+1.367)^2)

%% transfer function
% s = tf('s');
% w = {0.1,100};
% syms k

% L1 = 3/(s*(0.1*s+1));
% L2 = L1*(355/(s^2+1.1*s+355));
% C = 1*s^0;
% T1 = L1/(1+L1);
% T2 = L2/(1+L2);
% G0 = 246.7/(s^2+15.71*s+246.7);
% TD = 157.9/(s^2+25.13*s+157.9);
% Gf = (s^2+15.34*s+201.6)/(s^2+25.56*s+201.6);
% GT = TD*G0;
% G0f = Gf*G0;
% P1 = 987/(s^2+75.4*s+987);
% P2 = (1421/(s^2+67.86*s+1421))*((0.01*s+1)/(0.03*s+1))*(1/(0.035*s+1));
% [A,B,C,D] = tf2ss(246.7,[1,15.71,246.7]);
% G1 = 1/(0.1*s+1);
% % [A,B,C,D] = tf2ss(1,[0.1,1]);

% f = 30;
% ksi = 0.1;
% wd = 2*pi*f;
% wn = wd/((1-ksi^2)^0.5);
% G4 = wn^2/(s^2+2*ksi*wn*s+wn^2)

% A = [0,1;-246.7,-15.71];
% B = [0;246.7];
% C = [1,0];
% D = 0;
% sys1 = ss(A,B,C,D)
% [b,a] = ss2tf(A,B,C,D)
% 
% % A = [0,1;-10,-15];
% % B = [0;10];
% % C = [1,0];
% % D = 0;
% % sys2 = ss(A,B,C,D)
% % [b,a] = ss2tf(A,B,C,D)
% 
% A = [0,1;-987,-75.4];
% B = [0;987];
% C = [1,0];
% D = 0;
% sys3 = ss(A,B,C,D)
% [b,a] = ss2tf(A,B,C,D)
% 
% A = [0,1;-35890,-37.89];
% B = [0;35890];
% C = [1,0];
% D = 0;
% sys4 = ss(A,B,C,D)
% [b,a] = ss2tf(A,B,C,D)

% sys1 = 1/s;
% sys = (86.9*s+9691)/(s^2+136.7*s+10420)
% bode(sys)
% hinfnorm(sys)

% cascade lead compensator
% G0 = 10/(s*(s+1));
% Gc = (1+0.456*s)/(1+0.114*s);
% Gc0 = Gc*G0

%% state space
% first order close loop system 
% error system
% C = [1];
% D = 0;
% 
% k = 10;
% A = [-k];
% B = [1];
% sys1 = ss(A,B,C,D);
% 
% k = 10;
% A = [-k];
% B = [k];
% sys2 = ss(A,B,C,D);
% bode(sys2)
% 
% k = 10;
% A = [-k];
% B = [-k];
% sys3 = ss(A,B,C,D);
% step(sys3)
% 
% k = 15;
% A = [-k];
% B = [k];
% sys4 = ss(A,B,C,D);

% bandwidth(sys1)
% margin(sys1)
% linearSystemAnalyzer(sys1)

% second order open loop system
% k = 2;
% A = [0 1;-k^2 -2*k];
% B = [0;0];
% C = [0 1];
% D = 0;
% sys2 = ss(A,B,C,D);
% 
% A = [0 1;0 0];
% B = [0;1];
% C = [1 0];
% D = 0;
% sys3 = ss(A,B,C,D);

% non-minimun system
% A = [1 1 0;0 0 1;0 0 0];
% B = [0;0;1];
% C = [0 1 0];
% D = 0;
% sys3 = ss(A,B,C,D);
% [b,a] = ss2tf(A,B,C,D)

% butterworth
% fc = 100;
% fs = 10000;
% 
% [b,a] = butter(3,fc/(fs/2))

% lqr
% A = 0;
% B = 1;
% C = 1;
% D = 0;
% Q = 1;
% R = 1;
% sys = ss(A,B,C,D);
% [K,S,P] = lqr(sys,Q,R)

%% Solution of LTI State Equations
% format rat;
% 参考khalil 12.4 Integral Control via Linearization
% 直接套公式即可

% current closed loop
syms R L w
% A = [-R/L 0;1 0];
% B = [1/L;0];
% K1 = w*L;
% K2 = K1*R/L;
% K = [K1 K2];
% A_cl = A - B*K
% eig(A_cl)

% velocity closed loop
syms B J Km
syms Kp Ki
syms K1 K2

J = 2.2951e-5;
B = 1.1475e-5;
Kp = 0.35;
Ki = 140;
P = 14;% number of pole
phi_m = 0.00469;
Km = 3*P/4 *phi_m;

K1 = Kp;
K2 = Kp*Ki;

A = [-B/J 0;1 0];
B = [Km/J;0];
K = [K1 K2];
A_cl = A - B*K
eig(A_cl)
