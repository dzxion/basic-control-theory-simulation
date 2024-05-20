close all
clear
clc

s = tf('s');

%% MATLAB
% single-loop
% % plant
% P_vel = 1/s;
% % controller
% C_vel = tunablePID('controller_velocity','P');
% % analysis point
% d_for = AnalysisPoint('d1');
% err = AnalysisPoint('e');
% % closed-loop system
% CL0 = feedback(err*C_vel*d_for*P_vel,1);
% CL0.InputName = 'r';
% CL0.OutputName = 'y';
% % performance specifications
% % Rtrack = TuningGoal.Tracking('r','y',1,0.01);
% Rtrack = TuningGoal.StepTracking('r','y',0.05);
% % Rreject = TuningGoal.Gain('d1','e',0.1);
% % Rreject = TuningGoal.StepRejection('d1','e',0.25,5);
% % tuning
% % [CL,fSoft] = systune(CL0,[Rtrack,Rreject]);
% [CL,fSoft] = systune(CL0,Rtrack);
% % validation
% figure
% stepplot(CL);
% CLdist = getIOTransfer(CL,'d1','e');
% tf(CLdist)
% figure
% stepplot(CLdist);
% figure
% viewGoal([Rtrack],CL);
% % figure
% % viewGoal([Rreject],CL);
% showTunable(CL);

% multi-loop
% % plant
% P_vel = 1/s;
% P_pos = 1/s;
% % controller
% C_vel = tunablePID('controller_velocity','P');
% C_pos = tunablePID('controller_position','P');
% % analysis point
% d_for = AnalysisPoint('d1');
% err = AnalysisPoint('e');
% % closed-loop system
% Vel_Loop = feedback(C_vel*d_for*P_vel,1);
% CL0 = feedback(err*C_pos*Vel_Loop*P_pos,1);
% CL0.InputName = 'r';
% CL0.OutputName = 'y';
% % performance specifications
% % Rtrack = TuningGoal.Tracking('r','y',1,0.01);
% Rtrack = TuningGoal.StepTracking('r','y',0.05);
% % Rreject = TuningGoal.Gain('d1','e',0.1);
% % Rreject = TuningGoal.StepRejection('d1','e',0.25,5);
% % tuning
% % [CL,fSoft] = systune(CL0,[Rtrack,Rreject]);
% [CL,fSoft] = systune(CL0,Rtrack);
% % validation
% figure
% stepplot(CL);
% CLdist = getIOTransfer(CL,'d1','e');
% figure
% stepplot(CLdist);
% figure
% viewGoal([Rtrack],CL);
% % figure
% % viewGoal([Rreject],CL);
% showTunable(CL);

%% SIMULINK
sllin = slLinearizer('simple_model');
addPoint(sllin,{'r','e','u','y','d'});
CL = getIOTransfer(sllin,'r','y');
figure
stepplot(CL);
CLu = getIOTransfer(sllin,'d','e');
figure
stepplot(CLu);
