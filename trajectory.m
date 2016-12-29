% ReDySim trajectory module. The desired indpendent joint trejectories are 
% enterd here
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function [thi dthi ddthi]= trajectory(tim)
%Enter trajectories here

%Constant angular velocity
omega=45;
dthi=omega*2*pi/60;
ddthi=0;
thi=dthi*tim;
% trj=[thi;dthi;ddthi];
