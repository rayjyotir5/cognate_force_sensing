% ReDySim runfor module. This module perform the simulation.
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function []=runfor()
disp('------------------------------------------------------------------');
disp('Recursive forward dynamics ');
disp('Contibutors: Dr. Suril Shah and Prof. S. K. Saha @IIT Delhi ');
disp('------------------------------------------------------------------');

% LOADING INPUT DATA FILE AND INITIAL CONDITION
[n, y0, ti, tf, incr, rtol, atol, int_type] = initials();

%OPENING DATA FILE
fomode='w';
fip1=fopen('timevar.dat',fomode);%time
fip2=fopen('statevar.dat',fomode);%all state variables

%SET OPTION
%ODE CALL
disp('Simulation Started');
tic
option = odeset('RelTol',rtol,'AbsTol',atol,'stats','on');
if int_type==0
    [T,Y]=ode45(@sys_ode,ti:incr:tf,y0,option,n,tf);
elseif int_type==1
    [T,Y]=ode15s(@sys_ode,ti:incr:tf,y0,option,n,tf);
elseif int_type==2
    Y = ode5(@sys_ode,ti:incr:tf,y0,n,tf);
    T=ti:incr:tf;
else
    error('Select integrator correctly');
end
toc

%FOR LOOP FOR READING & WRITING SOLUTIONS FOR EACH INSTANT
for j=1:length(T)
    tsim=T(j);
    %WRITING SOLUTION FOR EACH INSTANT IN FILES
    fprintf(fip1,'%e\n',tsim);
    fprintf(fip2,'%e ',Y(j,:));
    fprintf(fip2,'\n');
end
disp('------------------------------------------------------------------');
disp('Recursive forward dynamics ');
disp('Contibutors: Dr. Suril Shah and Prof. S. K. Saha @IIT Delhi ');
disp('------------------------------------------------------------------');
end