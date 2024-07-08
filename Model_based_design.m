close all
clear
clc

s = tf('s');

%% systune(有bug)
% % single-loop
% % plant
% P_vel = 1/s;
% % controller
% C_vel = tunablePID('C1','PI');
% % analysis point
% d_for = AnalysisPoint('d');
% err = AnalysisPoint('e');
% % closed-loop system
% CL0 = feedback(err*C_vel*d_for*P_vel,1);
% CL0.InputName = 'r';
% CL0.OutputName = 'y';
% % performance specifications
% Rtrack = TuningGoal.StepTracking('r','y',0.05);
% % Rreject = TuningGoal.StepRejection('d','e',0.25,5);
% % tuning
% [CL,fSoft] = systune(CL0,Rtrack);
% % validation
% figure
% stepplot(CL);
% CLdist = getIOTransfer(CL,'d','e');
% tf(CLdist)
% figure
% stepplot(CLdist);
% figure
% viewGoal([Rtrack],CL);
% % figure
% % viewGoal([Rreject],CL);
% showTunable(CL);

%% slTuner
mdl = "second_order_system";
open_system(mdl)
st0 = slTuner(mdl,["C1","C2"]);
addPoint(st0,["r","p","d","n_p","e_1"]);
Rtrack = TuningGoal.StepTracking('r','p',0.05);
% Rreject = TuningGoal.StepRejection('d','e',0.25,5);
% tf(Rtrack.ReferenceModel)
% tf(Rreject.ReferenceModel)
% [st,fSoft] = systune(st0,[Rtrack,Rreject]);
[st,fSoft] = systune(st0,[Rtrack]);
% [st,fSoft] = systune(st0,[Rreject]);

CL = getIOTransfer(st,"r","p");
tf(CL)
% figure
% stepplot(CL);
figure
bodeplot(CL);
CLd2e = getIOTransfer(st,'d','e_1');
tf(CLd2e)
% figure
% stepplot(CLd2e);
figure
bodeplot(CLd2e);
CLr2e = getIOTransfer(st,'r','e_1');
% figure
% stepplot(CLr2e);
figure
bodeplot(CLr2e);
CLn2e = getIOTransfer(st,'n_p','e_1');
tf(CLn2e)
% figure
% stepplot(CLn2e);
figure
bodeplot(CLn2e);
% figure
% viewGoal([Rtrack],st);
% figure
% viewGoal([Rreject],st);
showTunable(st);
