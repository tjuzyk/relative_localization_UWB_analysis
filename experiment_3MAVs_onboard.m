%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% experiment_3MAVs_onboard.m
%
% Data analysis for leader-follower the experiment with the **3 MAVs using onboard sensing**.
% Please note that, depending on the start and end time of the analysis, the pictured distribution may slightly vary from the paper.
%
% The code was used in the paper:
%
% "On-board range-based relative localization for micro air vehicles in indoor leader–follower flight". 
% 
% Steven van der Helm, Mario Coppola, Kimberly N. McGuire, Guido C. H. E. de Croon.
% Autonomous Robots, March 2019, pp 1-27.
% The paper is available open-access at this link: https://link.springer.com/article/10.1007/s10514-019-09843-6
% Or use the following link for a PDF: https://link.springer.com/content/pdf/10.1007%2Fs10514-019-09843-6.pdf
% 
% Code written by Steven van der Helm and edited by Mario Coppola
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initialize
init;
printfigs = true;
fontsize = 20;

%% Gather and synch data from logs
datapath = 'data/08-02-2018/onboard';
addpath(datapath);
extract_data_3mavs

%% Extract data and assess performance assessment
mav22_assessdata % Drone #22 (follower 1)
mav18_assessdata % Drone #18 (follower 2)

%% Plot trajectory of all three drones together (Fig 30)
file = strcat('figures\2_follower_traj_onboard.eps');
xmin = -4; xmax = 6; xtick=1;
ymin = -5; ymax = 4; ytick = 1;
plot_experiment;
if printfigs
    print(file,'-depsc2');
end

%% Range error distribution 22
file = strcat('figures\rangeerr22_onboard.eps');
xmin = -1.5; xmax = 1.5; xtick = 0.5;
ymin = 0; ymax = 400; ytick = 50;
h = plot_range_err_distribution(rangeerr22,fontsize,xmin,xmax,xtick,ymin,ymax,ytick,printfigs);
if printfigs
    print(file,'-depsc2');
end

%% Range error distribution 18
file = strcat('figures\rangeerr18_onboard.eps');
xmin = -1.5; xmax = 1.5; xtick = 0.5;
ymin = 0; ymax = 300; ytick = 50;
h = plot_range_err_distribution(rangeerr18,fontsize,xmin,xmax,xtick,ymin,ymax,ytick,printfigs);
if printfigs
    print(file,'-depsc2');
end

%% EXTRA ASSESSMENTS DRONE 18

% file = strcat('..\..\..\Figures\NDI_experiments\leader_follower_plocerr_onboard.eps');
% xmin = 0; xmax = 0.8; xtick=0.1;
% ymin = 0; ymax = 300; ytick = 100;
% fontsize = 20;
% nbins = 50;
% h = figure;
% if (printfigs)
%     set(h,'Visible','off');
% end
% hold on;
% grid on;
% set(gca,'xtick',xmin:xtick:xmax,'ytick',ymin:ytick:ymax,'FontSize',fontsize,'FontName','Times');
% histogram(plocerr18,nbins);
% axis([xmin xmax ymin ymax]);
% line([MAEploc18 MAEploc18],get(gca,'YLim'),'Color','r','linewidth',2);
% xlabel('loc err');
% ylabel('Instances');
% xlabel('Localization error [m]','FontUnits','points','interpreter','latex','FontSize',fontsize,'FontName','Times');
% ylabel('Instances','FontUnits','points','interpreter','latex','FontSize',fontsize,'FontName','Times');
% legend('errors','mean');
% if (printfigs)
%     print(file,'-depsc2');
% end


% 
% % file = strcat('..\..\..\Figures\NDI_experiments\leader_follower_ptrackerr_onboard.eps');
% % xmin = 0; xmax = 1.5; xtick=0.2;
% % ymin = 0; ymax = 350; ytick = 50;
% % fontsize = 20;
% nbins = 50;
% h = figure;
% % if (printfigs)
% %     set(h,'Visible','off');
% % end
% hold on;
% grid on;
% % set(gca,'xtick',xmin:xtick:xmax,'ytick',ymin:ytick:ymax,'FontSize',fontsize,'FontName','Times');
% histogram(ptrackerr18,nbins);
% % axis([xmin xmax ymin ymax]);
% line([MAEptrack18 MAEptrack18],get(gca,'YLim'),'Color','r','linewidth',2);
% xlabel('track err');
% ylabel('Instances');
% % xlabel('Tracking error [m]','FontUnits','points','interpreter','latex','FontSize',fontsize,'FontName','Times');
% % ylabel('Instances','FontUnits','points','interpreter','latex','FontSize',fontsize,'FontName','Times');
% legend('errors','mean');
% % if (printfigs)
% %     print(file,'-depsc2');
% % end
% 
% 
% 
% 
% % file = strcat('..\..\..\Figures\NDI_experiments\leader_follower_rangeerr_onboard.eps');
% % xmin = -0.6; xmax = 1; xtick=0.2;
% % ymin = 0; ymax = 1000; ytick = 200;
% % fontsize = 20;
% nbins = 50;
% h = figure;
% % if (printfigs)
% %     set(h,'Visible','off');
% % end
% hold on;
% grid on;
% % set(gca,'xtick',xmin:xtick:xmax,'ytick',ymin:ytick:ymax,'FontSize',fontsize,'FontName','Times');
% histogram(rangeerr18(rangeerr18>-10),nbins);
% % axis([xmin xmax ymin ymax]);
% line([mean(rangeerr18) mean(rangeerr18)],get(gca,'YLim'),'Color','r','linewidth',2);
% xlabel('range err');
% ylabel('Instances');
% % xlabel('Range errror [m]','FontUnits','points','interpreter','latex','FontSize',fontsize,'FontName','Times');
% % ylabel('Instances','FontUnits','points','interpreter','latex','FontSize',fontsize,'FontName','Times');
% legend('errors','mean');
% % if (printfigs)
% %     print(file,'-depsc2');
% % end
% 
%% EXTRA ASSESSMENTS DRONE 22
% % file = strcat('..\..\..\Figures\NDI_experiments\leader_follower_traj_onboard.eps');
% % xmin = -4; xmax = 6; xtick=1;
% % ymin = -4; ymax = 4; ytick = 1;
% % fontsize = 20;
% h = figure;
% % set(gca,'xtick',xmin:xtick:xmax,'ytick',ymin:ytick:ymax,'FontSize',fontsize,'FontName','Times');
% % if (printfigs)
% %     set(h,'Visible','off');
% % end
% colors = get(gca,'colororder');
% hold on;
% grid on;
% % axis([xmin xmax ymin ymax]);
% plot(x44_22,y44_22,'color',colors(2,:));
% plot(x22,y22,'color',colors(1,:));
% xlabel('x');ylabel('y');
% % xlabel('x [m]','FontUnits','points','interpreter','latex','FontSize',fontsize,'FontName','Times');
% % ylabel('y [m]','FontUnits','points','interpreter','latex','FontSize',fontsize,'FontName','Times');
% % legend('leader','follower');
% % if (printfigs)
% %     print(file,'-depsc2');
% % end
% 
% % file = strcat('..\..\..\Figures\NDI_experiments\leader_follower_plocerr_onboard.eps');
% % xmin = 0; xmax = 0.8; xtick=0.1;
% % ymin = 0; ymax = 300; ytick = 100;
% % fontsize = 20;
% nbins = 50;
% h = figure;
% % if (printfigs)
% %     set(h,'Visible','off');
% % end
% hold on;
% grid on;
% % set(gca,'xtick',xmin:xtick:xmax,'ytick',ymin:ytick:ymax,'FontSize',fontsize,'FontName','Times');
% histogram(plocerr22,nbins);
% % axis([xmin xmax ymin ymax]);
% line([MAEploc22 MAEploc22],get(gca,'YLim'),'Color','r','linewidth',2);
% xlabel('loc err');
% ylabel('Instances');
% % xlabel('Localization error [m]','FontUnits','points','interpreter','latex','FontSize',fontsize,'FontName','Times');
% % ylabel('Instances','FontUnits','points','interpreter','latex','FontSize',fontsize,'FontName','Times');
% legend('errors','mean');
% % if (printfigs)
% %     print(file,'-depsc2');
% % end
% 
% 
% 
% % file = strcat('..\..\..\Figures\NDI_experiments\leader_follower_ptrackerr_onboard.eps');
% % xmin = 0; xmax = 1.5; xtick=0.2;
% % ymin = 0; ymax = 350; ytick = 50;
% % fontsize = 20;
% nbins = 50;
% h = figure;
% % if (printfigs)
% %     set(h,'Visible','off');
% % end
% hold on;
% grid on;
% % set(gca,'xtick',xmin:xtick:xmax,'ytick',ymin:ytick:ymax,'FontSize',fontsize,'FontName','Times');
% histogram(ptrackerr22,nbins);
% % axis([xmin xmax ymin ymax]);
% line([MAEptrack22 MAEptrack22],get(gca,'YLim'),'Color','r','linewidth',2);
% xlabel('track err');
% ylabel('Instances');
% % xlabel('Tracking error [m]','FontUnits','points','interpreter','latex','FontSize',fontsize,'FontName','Times');
% % ylabel('Instances','FontUnits','points','interpreter','latex','FontSize',fontsize,'FontName','Times');
% legend('errors','mean');
% % if (printfigs)
% %     print(file,'-depsc2');
% % end
% 
% 
% 
% 
% % file = strcat('..\..\..\Figures\NDI_experiments\leader_follower_rangeerr_onboard.eps');
% % xmin = -0.6; xmax = 1; xtick=0.2;
% % ymin = 0; ymax = 1000; ytick = 200;
% % fontsize = 20;
% nbins = 50;
% h = figure;
% % if (printfigs)
% %     set(h,'Visible','off');
% % end
% hold on;
% grid on;
% % set(gca,'xtick',xmin:xtick:xmax,'ytick',ymin:ytick:ymax,'FontSize',fontsize,'FontName','Times');
% histogram(rangeerr22(rangeerr22>-10),nbins);
% % axis([xmin xmax ymin ymax]);
% line([mean(rangeerr22) mean(rangeerr22)],get(gca,'YLim'),'Color','r','linewidth',2);
% xlabel('range err');
% ylabel('Instances');
% % xlabel('Range errror [m]','FontUnits','points','interpreter','latex','FontSize',fontsize,'FontName','Times');
% % ylabel('Instances','FontUnits','points','interpreter','latex','FontSize',fontsize,'FontName','Times');
% legend('errors','mean');
% % if (printfigs)
% %     print(file,'-depsc2');
% % end
