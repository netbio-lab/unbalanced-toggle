clear all
close all
clc

load balance_fine.mat

dA_vec = ((1+asym_vec)./(1-asym_vec)-1);
dA_vec(end) = 1e6;
dA = ((1+ASYM)./(1-ASYM));
dA(isinf(dA)) = 1e6;

ai = 0:0.1:100;
di = 0:0.001:10;
[Ai,Di] = meshgrid(ai,di);


f = figure('Position',[100 100 1200 600]);



ax = subplot(2,4,1);
[C,h] = contourf(A_mid,dA,100*E_uncomp.*MASK_nobal,[0 1 5 10 20 30 40],'EdgeColor','none');
axis square
grid on
xlim([0 100])
ylim([1 10])
xlabel('\alpha_0')
ylabel('a')
colormap(ax,othercolor('Blues9'))
set(gca, 'YScale', 'log')
set(gca,'XTick',[0:25:100],'XTickLabel',{0 '' '' '' 100},'YTick',[1:1:10],'YTickLabel',{1 '' '' '' '' '' '' '' '' 10})
set(findall(gca,'-property','FontSize'),'FontSize',FontSize)
clabel(C,h,'manual','FontSize',15,'FontWeight','bold')


ax = subplot(2,4,2);
[C,h] = contourf(A_mid,dA,100*E_comp.*MASK_bal,[0 1 5 10 20 30 40],'EdgeColor','none');
axis square
grid on
xlim([0 100])
ylim([0 10])
xlabel('\alpha_0')
ylabel('a')
colormap(ax,othercolor('Blues9'))
set(gca, 'YScale', 'log')
set(gca,'XTick',[0:25:100],'XTickLabel',{0 '' '' '' 100},'YTick',[1:1:10],'YTickLabel',{1 '' '' '' '' '' '' '' '' 10})
set(findall(gca,'-property','FontSize'),'FontSize',FontSize)
clabel(C,h,'manual','FontSize',15,'FontWeight','bold')

set(gcf,'renderer','Painters')
