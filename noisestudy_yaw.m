% Plot the results of Figure 14

init;

printfigs = true;
fontsize = 16;
linewidth = 1.2;

filenames = {'storeresmat_type12_compahead','storeresmat_type1_compahead_yawdisturbance'};

load(strcat(filenames{1},'.mat'));
storeres2 = storeres;
load(strcat(filenames{2},'.mat'));
storeres1 = storeres;

rangenoises = [0,0.1,0.25,0.5,1,2,4,8];
yawnoises   = [0, 0.25, 0.5, 1, 1.5]; % not plotting and 0.1
plotindices = [1, 3, 4  ,  5 , 6 ]; % skipping  0.1 at positions 2
percentarr  = zeros(size(rangenoises.*yawnoises.'));

for i = plotindices
    percentarr(i,:) = ((storeres2(2,:)-storeres1(i,:))./storeres1(i,:)) * 100;
end

file = strcat('figures/head_nohead_disturbance_percentage_mult.eps');

cmap = jet(8);
h = figure('Position', [480, 430, 560, 450]);
ya = [-100,60];
yt = 20;
xa = [0,8];
xt = 1;
hold on;
grid on;
set(gca,'XTick',xa(1):xt:xa(2),'YTick',ya(1):yt:ya(2),'FontSize',fontsize,'FontUnits','points','FontWeight','normal','FontName','Times');

plot(rangenoises,percentarr(1,:),'-p','linewidth',linewidth);
plot(rangenoises,percentarr(3,:),'-o','linewidth',linewidth);
plot(rangenoises,percentarr(4,:),'-v','linewidth',linewidth);
plot(rangenoises,percentarr(5,:),'-s','linewidth',linewidth);
plot(rangenoises,percentarr(6,:),'-d','linewidth',linewidth);
plot(xa,zeros(1,2),'--','Color','black');
axis([xa ya]);
xlabel('Range noise $\sigma_{R}$ [m]','FontUnits','points','interpreter','latex','FontSize',fontsize,'FontName','Times');
ylabel('Localization error [\%]','FontUnits','points','interpreter','latex','FontSize',fontsize,'FontName','Times');
legentries = cell(1,length(yawnoises));
for i = 1:length(yawnoises)
    legentries{i} = strcat('$A_d$=',num2str(yawnoises(i)));
end
leg1 = legend(legentries);
set(leg1,'Location','SouthEast');
set(leg1,'Interpreter','latex');
set(leg1,'FontSize',fontsize);
if (printfigs)
    print(file,'-depsc2');
end
