close all
clear
clc

s = tf('s');
P_vel = 1/s;
P_pos = 1/s;
C_vel = tunablePID('controller_velocity','PI');
C_pos = tunablePID('controller_position','P');
d_for = AnalysisPoint('d1');
Vel_Loop = feedback(C_vel*d_for*P_vel,1);
CL0 = feedback(C_pos*Vel_Loop*P_pos,1);
CL0.InputName = 'r';
CL0.OutputName = 'y';
Rtrack = TuningGoal.Tracking('r','y',1,0.01);
Rreject = TuningGoal.Gain('d1','y',0.1);
[CL,fSoft] = systune(CL0,[Rtrack,Rreject]);