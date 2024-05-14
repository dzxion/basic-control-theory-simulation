close all
clear
clc

s = tf('s');
plant_velocity_dynamic = 1/s;
plant_position_dynamic = 1/s;
controller_velocity = tunablePID('controller_velocity','PI');
controller_position = tunablePID('controller_position','P');
