close all

s = tf('s');
w = {0.1,100};
L1 = 3/(s*(0.1*s+1));
L2 = L1*(355/(s^2+1.1*s+355));
C = 1*s^0;
T1 = L1/(1+L1);
T2 = L2/(1+L2);
G0 = 246.7/(s^2+15.71*s+246.7);
TD = 157.9/(s^2+25.13*s+157.9);
Gf = (s^2+15.34*s+201.6)/(s^2+25.56*s+201.6);
GT = TD*G0;
G0f = Gf*G0;
P1 = 987/(s^2+75.4*s+987);
P2 = (1421/(s^2+67.86*s+1421))*((0.01*s+1)/(0.03*s+1))*(1/(0.035*s+1));
% [A,B,C,D] = tf2ss(987,[1,75.4,987])
% ssP2 = tf2ss(P2)
G1 = 1/(0.1*s+1);
% [A,B,C,D] = tf2ss(1,[0.1,1]);
ninfG0 = hinfnorm(G0);
ninfGT = hinfnorm(GT);
ninfG0f = hinfnorm(G0f);
A = [0,1;-10,-10]
eig(A)

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
% figure;
% bode(G0,GT,G0f,w);
% legend('G0','GT','G0f');
% grid;
% % 
% figure;
% step(G0,GT,G0f);
% legend('G0','GT','G0f');
% grid;

% figure;
% bode(P1,P2);
% legend('P1','P2');
% grid;
% 
% figure;
% step(P1,P2);
% legend('P1','P2');
% grid;
