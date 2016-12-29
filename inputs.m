% ReDySim input module.The model parameters are entered in this module
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function [n dof type alp a b bt dx dy dz m g  Icxx Icyy Iczz Icxy Icyz Iczx aj al angs]=inputs() 

%System Fourbar Mechanism
%Number of links 
n=9;

%Degree of fredom of the system
dof=1;

%system type
type=1; %1 for Closed-loop and 0 for open-loop

% Model
model.l1 = 2+sqrt(3);
model.l2 = 1;
model.l3 = 2;
model.l4 = 1;
% model.theta2 = -57.04*pi/180;
model.alpha = pi/3;
model.beta = pi/3;

% Link lengths
a12 = model.l1;
a13 = model.l2;
a24 = model.l4;
a34 = model.l3;
a35 = a34/(cos(model.alpha)+(sin(model.alpha)/tan(model.beta)));
a45 = a34/(cos(model.beta)+(sin(model.beta)/tan(model.alpha)));
a16 = a35;
a28 = a45;
a56 = a13;
a58 = a24;
a67 = a35*a56/a34;
a59 = a35*a58/a34;
a57 = a45*a56/a34;
a89 = a45*a58/a34;
a70 = a59;
a90 = a57;
al=[a12, a13, a24, a34, a35, a45, a16, a28, a56, a58, a67, a59, a57, a89, a70, a90];
angs = [model.alpha, model.beta];
%DH PARAMETERs
alp=[0 0 0 0 0 0 0 0 0];
a=[0 a12 a24 0 a16 a67 a12 a28 a89];
b=[0 0 0 0 0 0 0 0 0];
%PARENT ARRAY
bt=[0 0 2 0 4 5 0 7 8];

%Actuated joints of open tree
aj=[1 0 0 0 0 0 0 0 0]; %enter 1 for actuated joints and 0 otherwise


% d - VECTOR FORM ORIGIN TO CG 
% dx=[a13/2   a24/2   (a34 + a35*cos(model.alpha))/3   a16/2   (a67 + a56*cos(model.alpha))/3   a70/2   a28/2   (a89 + a58*cos(model.beta))/3   a90/2];    
dx=[a13/2   a24/2   (a34 + a35*cos(model.alpha))/3   a16/2   (a67 + a56*cos(model.alpha))/3   a70   a28/2   (a89 + a58*cos(model.beta))/3   a90];    
dy=[0     0     -a35*sin(model.alpha)/3    0   -a56*sin(model.alpha)/3  0   0   a58*cos(model.beta)/3   0];
dz=[0     0     0     0     0     0     0     0     0];

% MASS AND MOMENT OF INERTIA AND GRAVITY
m=[0.1;   0.1;  0.1;  0.1;   0.1;  10;   0.1;   0.1;  10];
% g=[0; -9.81; 0];
g=[0; 0; 0];

%Inertia Tensor of the kth link about Center-Of-Mass (COM) in ith frame
%which is rigidly attach to the link
% % ------------------------------------------------------------------------------------------
% % Edit Moment of inertias of 3rd, 5th and 8th triangular links by changing xx,yy,zz,xy,yz,zx
% % if link-mass is non zero
% % ------------------------------------------------------------------------------------------
Icxx=zeros(n,1);Icyy=zeros(n,1);Iczz=zeros(n,1); % Initialization 
Icxy=zeros(n,1);Icyz=zeros(n,1);Iczx=zeros(n,1); % Initialization 
Icxx(1)=(1/12)*m(1)*.01*.01;   Icyy(1)=(1/12)*m(1)*al(1)*al(1);  Iczz(1)=(1/12)*m(1)*al(1)*al(1); 
Icxx(2)=(1/12)*m(2)*.01*.01;   Icyy(2)=(1/12)*m(2)*al(2)*al(2);  Iczz(2)=(1/12)*m(2)*al(2)*al(2);
Icxx(3)=(1/12)*m(3)*.01*.01;   Icyy(3)=(1/12)*m(3)*al(3)*al(3);  Iczz(3)=(1/12)*m(3)*al(3)*al(3);
Icxx(4)=(1/12)*m(4)*.01*.01;   Icyy(4)=(1/12)*m(4)*al(4)*al(4);  Iczz(4)=(1/12)*m(4)*al(4)*al(4); 
Icxx(5)=(1/12)*m(5)*.01*.01;   Icyy(5)=(1/12)*m(5)*al(5)*al(5);  Iczz(5)=(1/12)*m(5)*al(5)*al(5);
Icxx(6)=(1/12)*m(6)*.01*.01;   Icyy(6)=(1/12)*m(6)*al(6)*al(6);  Iczz(6)=(1/12)*m(6)*al(6)*al(6);
Icxx(7)=(1/12)*m(7)*.01*.01;   Icyy(7)=(1/12)*m(7)*al(7)*al(7);  Iczz(7)=(1/12)*m(7)*al(7)*al(7); 
Icxx(8)=(1/12)*m(8)*.01*.01;   Icyy(8)=(1/12)*m(8)*al(8)*al(8);  Iczz(8)=(1/12)*m(8)*al(8)*al(8);
Icxx(9)=(1/12)*m(9)*.01*.01;   Icyy(9)=(1/12)*m(9)*al(9)*al(9);  Iczz(9)=(1/12)*m(9)*al(9)*al(9);
end