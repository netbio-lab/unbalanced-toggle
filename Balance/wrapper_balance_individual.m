clear all
close all
clc


FontSize = 20;

Na = 100;
Nb = 10;

T_end = 20;
a = [90 110];

[error b_opt] = Balance(a,Na,Nb,T_end)


figure('Position',[0 0 900 900])
subplot(1,2,1)
[e,Y,Z,WRONG1] = Error(a,[0 0],T_end,Na);
e
WRONG1 = double(WRONG1);
WRONG1(WRONG1==0) = NaN

surf(Y,Z,WRONG1,'EdgeColor','none')
view(2)
axis square
xlim([0 max(a)])
ylim([0 max(a)])
title('w/o balancing')
xlabel('v')
ylabel('w')

as

subplot(1,2,2)
[e,Y,Z,WRONG2] = Error(a,b_opt,T_end,Na);
e
WRONG2 = 2*double(WRONG2);
WRONG2(WRONG2==0) = NaN

surf(Y,Z,WRONG2,'EdgeColor','none')

view(2)
axis square
xlim([0 max(a)])
ylim([0 max(a)])
title('w/ balancing')
xlabel('v')
ylabel('w')


set(findall(gcf,'-property','FontSize'),'FontSize',FontSize)