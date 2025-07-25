close all
clear
clc

s = tf('s');

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

%% 参考khalil 12.4 Integral Control via Linearization
% 直接套公式即可
% J = 2.2951e-5;
% B = 1.1475e-5;
% Kp_v = 0.35;
% Ki_v = 140;
% Ki_v = Kp_v*Ki_v;
% P = 14;% number of pole
% phi_m = 0.00469;
% Km = 3*P/4 *phi_m;
% L = 2.39e-3;
% R = 5.2;
% wc = 130;
% Kp_i = wc*L;
% Ki_i = R/L;
% Ki_i = Kp_i*Ki_i;

% current closed loop
% syms R L w
% A = [-R/L 0;1 0];
% B = [1/L;0];
% K1 = w*L;
% K2 = K1*R/L;
% K = [K1 K2];
% A_cl = A - B*K
% eig(A_cl)

% velocity closed loop
% syms B J Km real
% syms Kp Ki real
% syms K1 K2 real
% 
% 
% K1 = Kp;
% K2 = Kp*Ki;
% 
% A = [-B/J 0;1 0];
% B = [Km/J;0];
% K = [K1 K2];
% A_cl = A - B*K
% eig(A_cl)
% 
% % Q = eye(2)
% % syms p11 p12 p21 p22
% % X = [p11 p12;p21 p22];
% % 
% % eqn = X*A_cl + A_cl'*X == -Q
% % S = solve(eqn,X)
% % 
% % P_1 = [S.p11 S.p12;S.p21 S.p22]
% % 
% % % eig(P_1)
% % P_1*A_cl + A_cl'*P_1

% cascade closed loop
% x1 = w - w*
% x2 = sigma_v - sigma_v*
% x3 = i - i_ref
% x4 = sigma_i - sigma_i*
% A = [-(B+Km*Kp_v)/J -Km*Kp_v*Ki_v/J     Km/J          0;
%            1          0                  0            0;
%            0          0             (-R-Kp_i)/L -Kp_i*Ki_i/L;
%            0          0                  1            0];
% eig(A)

% A = [-(B+Km*Kp_v)/J                      -Km*Ki_v/J                 Km/J              0;
%            1                               0                         0                0;
%      Kp_v*R/L-Kp_v*(B+Km*Kp_v)/J+Ki_v  Ki_v*R/L-Km*Ki_v*Kp_v/J (-R-Kp_i)/L+Km*Kp_v/J -Ki_i/L;
%            0                               0                         1                0];
% eig(A)

% mixsyn
% G = (s-1)/(s+1)^2;
% W1 = makeweight(10,[1 0.1],0.01);
% W2 = makeweight(0.1,[32 0.32],1);
% W3 = makeweight(0.01,[1 0.1],10);
% tf(W1)
% [K,CL,gamma] = mixsyn(G,W1,W2,W3);
% S = feedback(1,G*K);
% KS = K*S;
% T = 1-S;
% bode(S,W1,1/W1)
% legend('S','W1','1/W1');
% W1 = 15*((s/(s+0.05))*(5/(s+5)))^2;
% W1_inv = 1/W1;
% bode(W1_inv)

% bode
% G1 = 30*s^0;
% G2 = s+1;
% G3 = 1/((s+0.01)^2);
% G4 = 1/(s+10);
% G5 = G1*G2*G3*G4;
% bode(G1,G2,G3,G4,G5)
% legend("G1","G2","G3","G4","G5")

% G1 = 1/(s+1);
% G2 = 1/(s+10);
% bode(G1,G2)
% legend("G1","G2")

% M = 1.5;
% wb = 10;
% A = 1.e-4;
% 
% Wp1 = (s/M+wb)/(s+wb*A);
% Wp1_inv = 1/Wp1;
% 
% Wp2 = (s/M^0.5+wb)^2/(s+wb*A^0.5)^2;
% Wp2_inv = 1/Wp2;
% 
% bode(Wp1_inv,Wp2_inv)
% legend("Wp1^{-1}","Wp2^{-1}")

% Weighting function
% Wl = makeweight(100,[1,3.16],0.1);
% Wh = makeweight(0.316,10,100);
% tf(Wl)
% tf(Wh)
% bodemag(Wl,Wh)
% legend
% grid on

% W3c = makeweight(0.316,[1 2],100,0,3);
% W2c = makeweight(0.316,[1 2],100,0,2);
% W1c = makeweight(0.316,[1 2],100);
% bodemag(W3c,W2c,W1c)
% legend
% grid on

% W = makeweight(1,[40 3.16],100);
% W_inv = 1/W;
% W_inv_tf = tf(W_inv)
% bode(W_inv_tf)

% getIOTransfer
% G1 = tf(10,[1 10]);
% G2 = tf([1 2],[1 0.2 10]);
% C1 = tunablePID('C','pi');
% C2 = tunableGain('G',1);
% X1 = AnalysisPoint('X1');
% X2 = AnalysisPoint('X2');
% T = feedback(G1*feedback(G2*C2,X2)*C1,X1);
% T.InputName = 'r';
% T.OutputName = 'y';
% H1 = getIOTransfer(T,'X1','y');
% H2 = getIOTransfer(T,'X2','y');
% H = getIOTransfer(T,{'X1','X2'},'y');

% hinfstruct
% G = tf([1 2],[1 5 10]);% plant model
% kp = realp('kp', 1);
% ki = realp('ki', 1);
% kd = realp('kd', 1);
% C = (kd*s^2+kp*s+ki)/s;
% S = feedback(1,G*C);
% T = feedback(G*C,1);
% W1 = (0.01*s+35)/(s+0.01);
% W2 = (6.67*s+100)/(0.01*s+400);
% H0 = blkdiag(W1*S, W2*T);
% H = hinfstruct(H0);

%% longitudinal passenger jet(use hinfstruct to tune)
% openExample('control/concorde_demo')
% open_system('rct_concorde')

% Tuning Setup
% ST0 = slTuner('rct_concorde',{'Ki','Kp','Kq','Kf','RollOff'});
% % wn = realp('wn', 3);               % natural frequency
% % zeta = realp('zeta',0.8);          % damping
% % Fro = tf(wn^2,[1 2*zeta*wn wn^2]); % parametric transfer function
% % setBlockParam(ST0,'RollOff',Fro)   % use Fro to parameterize "RollOff" block
% 
% % Design Requirements
% T1=ST0.getIOTransfer('Nzc','e');% tracking
% T2=ST0.getIOTransfer('n','delta_m'); % roll-off
% T3=ST0.getIOTransfer('w','delta_m'); % margins
% W1 = 15*((s/(s+0.05))*(5/(s+5)))^2;
% W2 = (s/(s+8))*(((1/8^2)*s^2+(2^0.5/8)*s+1)/((1/800^2)*s^2+(2^0.5/800)*s+1));
% W3 = 0.8;

% % Autopilot Tuning
% H0 = blkdiag(W1*T1, W2*T2, W3*T3)
% H = hinfstruct(H0);%H is tuned versionof H0
% ST0.setBlockValue(H);
% Fro = getBlockValue(ST0,'RollOff');
% 
% % Closed-Loop Simulations
% Gref = tf(1.7^2,[1 2*0.7*1.7 1.7^2]);    % reference model
% T = getIOTransfer(ST0,'Nzc','Nz');  % transfer Nzc -> Nz
% figure, step(T,'b',Gref,'b--',6), grid,
% ylabel('N_z'), legend('Actual response','Reference model')
% 
% T = getIOTransfer(ST0,'Nzc','delta_m');  % transfer Nzc -> delta_m
% Kf = getBlockValue(ST0,'Kf');            % tuned value of Kf
% Tff = Fro*Kf;         % feedforward contribution to delta_m
% figure
% step(T,'b',Tff,'g--',T-Tff,'r-.',6), grid
% ylabel('\delta_m'), legend('Total','Feedforward','Feedback')
% 
% OL = getLoopTransfer(ST0,'delta_m',-1); % negative-feedback loop transfer
% figure
% margin(OL);
% grid;
% xlim([1e-3,1e2]);

% Discretization
% sys1 = 2/(s^2+3*s+2);
% A = [0 1;-2 -3];
% B = [0;2];
% C = [1 0];
% D = 0;
% sys2 = ss(A,B,C,D);
% 
% Ts = 0.1;
% I = eye(2);
% A_d = inv((I-Ts/2*A))*(I+Ts/2*A);
% B_d = inv((I-Ts/2*A))*Ts/2*B;
% C_d = C*(A_d+I);
% D_d = C*B_d+D;
% sys3 = ss(A_d,B_d,C_d,D_d,0.1)
% 
% A_d1 = [0.7236 -0.0861;0.1722 0.9909];
% B_d1 = [0.0609;0.0064];
% C_d1 = [0 1.4142];
% D_d1 = 0;
% sys4 = ss(A_d1,B_d1,C_d1,D_d1,0.1);
% 
% sys5 = c2d(sys2,0.1);
% sys6 = c2d(sys2,0.1,'tustin')
% 
% step(sys1,sys3,sys6)
% legend

% esc model
% syms B J c Kt w_eq R Lq phi_m n real
% syms Kp_i Ki_i Ki_v real
% % esc open-loop
% % x1 = w - w_eq
% % x2 = iq - iq_eq
% 
% % plant
% J = 2.2951e-5;
% B = 1.1475e-5;
% c = 7.5e-8;
% n = 7;
% P = 2*n;
% phi_m = 0.000487;
% Kt = 3/4*P*phi_m;
% Lq = 19.0e-6;
% R = 0.12;
% 
% % controller
% wc = 1000;
% Kp_i = wc*Lq;
% Ki_i = R/Lq;
% Ki_i = Kp_i*Ki_i;
% Ki_v = 500;
% 
% % equilibrium point 
% w_eq = 240;
% i_eq = 0.8;
% v_eq = 0.95;
% i_int_eq = v_eq/Ki_i;
% v_int_eq = 0;
% 
% % A_ol = [-(B+2*c*w_eq)/J Kt/J;
% %         -n*phi_m/Lq -R/Lq]
% % eig(A_ol)
% % C_ol = [1 0];
% % x0 = [-w_eq;-i_eq];
% % sys_ol = ss(A_ol,[],C_ol,[]);
% % figure
% % initial(sys_ol,x0)
% % hold on
% 
% % esc close-loop
% % x1 = w - w*
% % x2 = iq - iq*
% % x3 = sigma_iq_delta = sigma_iq - sigma_iq*
% % x4 = sigma_vq_delta = sigma_vq - sigma_vq*
% 
% A_cl = [-(B+2*c*w_eq)/J         Kt/J             0         0;
%         -(Kp_i/R+1)*n*phi_m/Lq -(R+Kp_i)/Lq -Ki_i/Lq -Kp_i*Ki_v/Lq;
%              n*phi_m/R            1              0         Ki_v;
%           -n*phi_m/R*Kp_i      -Kp_i           -Ki_i -Kp_i*Ki_v]
% eig(A_cl)
% % C_cl = [1 0 0 0];
% % x0 = [-w_eq;-i_eq;-i_int_eq;-v_int_eq];
% % sys_cl = ss(A_cl,[],C_cl,[]);
% % initial(sys_cl,x0)

%% quadratic
% syms A B P Q R u0 u1 real
% expand([u0 u1]*[B 0;A*B B]'*[Q 0;0 P]*[B 0;A*B B]*[u0;u1])
% H = [0.8170 0.3726;0.3726 0.2411]
% expand([u0 u1]*H*[u0;u1])
% [0 1]*[1 0;0 1]*[0;1]

%% Riccati equations
% A = [1 1;
%      0 1];
% B = [0;
%      1];
% Q = [1 0;
%      0 1];
% R = 0.01;
% [X,L,G] = dare(A,B,Q,R)

%% ode
% tspan = [0 10];
% k = 1;
% x_init = 10;
% alpha = 0.1;
% [t1,x1] = ode45(@(t,x) -k*x,tspan,x_init);
% [t2,x2] = ode45(@(t,x) -k*sign(x)*(abs(x))^alpha,tspan,x_init);

%% matlabFunction
syms x y z
r = x + y/2 + z/3;
matlabFunction(r,"File","myfile","Vars",[y z x]);