close all
clear
clc

s = tf('s');
% System parameters
m = 4;				% mass of aircraft
J = 0.0475;			% inertia around pitch axis
r = 0.25;			% distance to center of force
g = 9.8;			% gravitational constant
c = 0.05;	 		% damping factor (estimated)

% Transfer functions for dynamics
Pi = tf([r], [J, 0, 0]);	% inner loop (roll)

% % Use state space versions
% Pi = tf2ss(Pi)

%
% Inner loop control design
%
% This is the controller for the pitch dynamics.  Goal is to have
% fast response for the pitch dynamics so that we can use this as a 
% control for the lateral dynamics
%

% Design a simple lead controller for the system
k = 200;  a = 2;  b = 50;
Ci1 = k*tf([1, a], [1, b]);		% lead compensator
Li1 = Ci1*Pi;


% % Bode plot for the open loop process
% figure(1); 
% bode(Pi);
% 
% % Bode plot for the loop transfer function, with margins
% figure(2); 
% bode(Li);

% Compute out the gain and phase margins
%! Not implemented
[gm, pm, wcg, wcp] = margin(Li1)

% Compute the sensitivity and complementary sensitivity functions
Si1 = feedback(1, Li1);
Ti1 = feedback(Li1, 1)

% Design a PD controller for the system
k1 = 1000;k2 = 100;
Ti2 = tf([r/J*k1], [1, r/J*k2, r/J*k1])

% Check to make sure that the specification is met
% figure(3);  
% bode(Si);
% figure;  
% bode(Ti1,Ti2);
% legend('lead','pd');

% simple loop function
k = 10;
Li3 = k/s;
Ti3 = feedback(Li3, 1)

[gm, pm, wcg, wcp] = margin(Li3)