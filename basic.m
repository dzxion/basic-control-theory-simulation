close all
clear
clc

s = tf('s');
w = {0.1,100};

% L1 = 3/(s*(0.1*s+1));
% L2 = L1*(355/(s^2+1.1*s+355));
% C = 1*s^0;
% T1 = L1/(1+L1);
% T2 = L2/(1+L2);
G0 = 246.7/(s^2+15.71*s+246.7);
TD = 157.9/(s^2+25.13*s+157.9);
Gf = (s^2+15.34*s+201.6)/(s^2+25.56*s+201.6);
GT = TD*G0;
G0f = Gf*G0;
eigg0 = eig(G0)
eiggt = eig(GT)
eigg0f = eig(G0f)
% P1 = 987/(s^2+75.4*s+987);
% P2 = (1421/(s^2+67.86*s+1421))*((0.01*s+1)/(0.03*s+1))*(1/(0.035*s+1));
% [A,B,C,D] = tf2ss(246.7,[1,15.71,246.7]);
% G1 = 1/(0.1*s+1);
% % [A,B,C,D] = tf2ss(1,[0.1,1]);
% ninfG0 = hinfnorm(G0);
% ninfGT = hinfnorm(GT);
% ninfG0f = hinfnorm(G0f);

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
% eig1 = eig(A)
% hinfnorm1 = hinfnorm(sys1)
% 
% % A = [0,1;-10,-15];
% % B = [0;10];
% % C = [1,0];
% % D = 0;
% % sys2 = ss(A,B,C,D)
% % [b,a] = ss2tf(A,B,C,D)
% % eig2 = eig(A)
% % hinfnorm2 = hinfnorm(sys2)
% 
% A = [0,1;-987,-75.4];
% B = [0;987];
% C = [1,0];
% D = 0;
% sys3 = ss(A,B,C,D)
% [b,a] = ss2tf(A,B,C,D)
% eig3 = eig(A)
% hinfnorm3 = hinfnorm(sys3)
% 
% A = [0,1;-35890,-37.89];
% B = [0;35890];
% C = [1,0];
% D = 0;
% sys4 = ss(A,B,C,D)
% [b,a] = ss2tf(A,B,C,D)
% eig4 = eig(A)
% hinfnorm4 = hinfnorm(sys4)
% 
% figure
% step(sys1,sys3,sys4)
% figure
% bode(sys1,sys3,sys4)

% bode(L1);
% bode(L2);
% bode(C);
% bode(G0);

% figure;
% bode(L1,L2);
% legend('L1','L2');
% grid;
% 
% figure;
% bode(T1,T2);
% legend('T1','T2');
% grid;
% 
% figure;
% step(L1,L2);
% legend('L1','L2');
% grid;
% 
% figure;
% step(T1,T2);
% legend('T1','T2');
% grid;

% figure;
% bode(TD);
% legend('TD');
% grid;
% 
figure;
bode(G0,GT,G0f,w);
legend('G0','GT','G0f');
grid;
% 
figure;
step(G0,GT,G0f);
legend('G0','GT','G0f');
grid;

% figure;
% bode(P1,P2);
% legend('P1','P2');
% grid;
% 
% figure;
% step(P1,P2);
% legend('P1','P2');
% grid;
