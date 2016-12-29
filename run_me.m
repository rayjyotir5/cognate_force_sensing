% ReDySim main module. Use this module to run your program
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi
% Contact: surilvshah@mail.com or saha@mech.iitd.ac.in

function [] = run_me()
clear all;
fclose all;
clc;
%Use this file to run your program
%Run the main code
runfor;
%Plots the joint motion
plot_motion;
%Plots the joint accelerations and joint torques
plot_acc_tor;
%Energy Calculation
energy;
%Plots Energy Balance
plot_en;
% Animation
animate;
clear all