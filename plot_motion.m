% ReDySim plot_motion module. This module plot joint positions and velocities
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function[]=plot_motion()
disp('------------------------------------------------------------------');
disp('Generating plots for joint motions');

% %PLOTTING THE RESULTS
[n]=initials;
load statevar.dat;
load timevar.dat;
Y=statevar;T=timevar;

set(0,'DefaultLineLineWidth',1.5,'DefaultLineMarkerSize',3)

fh2=figure('Name','Joint Motions','NumberTitle','off');
set(fh2, 'color', 'white'); % sets the color to white 
subplot(1,2,1)
plot(T,Y(:,1:n))
% plot(T,Y(:,15))
set (gca,'fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5,'Box', 'off','TickDir','out' );
xlabel('time (s)','FontSize',10);
ylabel('Joint angles (rad)','FontSize',10);

subplot(1,2,2)
plot(T,Y(:,n+1:2*n))
set (gca,'fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5,'Box', 'off','TickDir','out' );
xlabel('time (s)','FontSize',10);
ylabel('Joint rates (rad/s)','FontSize',10);
end