close all
clear
clc

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
Ci = k*tf([1, a], [1, b]);		% lead compensator
Li = Pi*Ci;

% Bode plot for the open loop process
figure(1); 
bode(Pi);

% Bode plot for the loop transfer function, with margins
figure(2); 
bode(Li);

% Compute out the gain and phase margins
%! Not implemented
[gm, pm, wcg, wcp] = margin(Li);

% Compute the sensitivity and complementary sensitivity functions
Si = feedback(1, Li);
Ti = Li * Si;

% Check to make sure that the specification is met
figure(3);  
bode(Si);
figure(4);  
bode(Ti);