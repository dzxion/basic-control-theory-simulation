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
% H = 1/s;
% H1 = 1/(s+1);
% H2 = 1*s^0;
% H3 = 1+1/s;
% H4 = (10*s+1)/(s+1)
% % bode(H,H1)
% figure
% bode(H,H2,H3)
% legend
% figure
% margin(H4)
    
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
% syms x y z
% r = x + y/2 + z/3;
% matlabFunction(r,"File","myfile","Vars",[y z x]);

% A = [zeros(3),eye(3);
%     zeros(3),zeros(3);]
% eig(A)

%% nyquist
% H = 1/((s+1))^2;
% nyquist(H)

%% lead lag boost
opt = bodeoptions;
opt.FreqUnits = 'Hz';
opt.Grid = 'on';

gain = 10;
fi = 0.5;
comp_fc = 2;
comp_gain = 5;
PI = (gain*s+2*pi*fi)/s;
PI1 = (gain*s+2*pi*fi*10)/s;
figure
bode(PI,PI1,opt);
lead = (gain*s+2*pi*fi)/s * (s/(2*pi*comp_fc)+1)/(s/(2*pi*comp_fc*comp_gain)+1);
lag = (gain*s+2*pi*fi)/s * (s/(2*pi*comp_fc*comp_gain)+1)/(s/(2*pi*comp_fc)+1);
boost = (gain*s+2*pi*fi)/s * comp_gain*(s/(2*pi*comp_fc*comp_gain)+1)/(s/(2*pi*comp_fc)+1);
sys1 = (10*gain*s+2*pi*fi)/s;
figure
bode(PI,lead,lag,boost,sys1,opt);
legend('PI','lead','lag','boost','sys1');
