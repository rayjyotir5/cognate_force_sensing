% ReDySim plot_en module. This module plots total energy for
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function[]=plot_en()
disp('------------------------------------------------------------------');
disp('Plots the Energy balance');

load envar.dat;
load timevar.dat;
EN=envar;T=timevar;
n=inputs();

fh1=figure('Name','Energy Balance','NumberTitle','off');
set(fh1, 'color', 'white'); % sets the color to white
plot(T,EN(:,1),T,EN(:,2),T,EN(:,3),T,EN(:,4));
set (gca,'fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5,'Box', 'off','TickDir','out' );
xlabel('time (s)','FontSize',10);
ylabel('Energy (J)','FontSize',10);
h=legend('Potential','Kinetic','Actuator','Total');
set(h,'Orientation','horizontal','Color', 'none','Box', 'off','Location','northoutside','fontsize',10,'fontweight','n','fontname','times new romans','linewidth',0.5)

% accumulated_error=(sum(TE-TE(1))*100)/TE(1)
% maximum_ele_error=(max(abs(TE-TE(1)))*100)/TE(1)