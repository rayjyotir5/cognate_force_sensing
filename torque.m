% ReDySim torque module. The control algorithm is entered here
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function [tau_d] = torque(t,tf, n, dof, th,dth)

% % Free Simulatoin
tau_d = -dth;
tau_d(1) = 100*(pi+1/6-th(1));
% % Force Simulation: Set point PD control
% tau_d=zeros(n,1);
% thd=pi/2;
% dthd=0;
% kp=3;kd=12;
% tau_d(1)=kp*(thd-th(1))+kd*(dthd-dth(1));

end

