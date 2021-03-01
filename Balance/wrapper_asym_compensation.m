clear all
close all
clc

FontSize = 20;
LineWidth = 5;
colors = [255 44 121 ; 29 190 185 ; 167 48 220 ; 0 114 189 ; 241 90 41]/255;





a_mid_vec = 2:2:100;
asym_vec  = [0:0.02:1];


% % Good for the figure
% a_mid_vec = 2:0.1:20;
% asym_vec  = [0:0.005:0.5];

ss_tol = 0.1;


Na = 10;
Nb = 10;

T_end = 20;

[A_mid, ASYM] = meshgrid(a_mid_vec,asym_vec);
[row,column] = size(A_mid);

for i = 1:row
    tic
    for j = 1:column
        a_mid = A_mid(i,j);
        asym  = ASYM(i,j);
        
  
        a = [a_mid*(1-asym) a_mid*(1+asym)];
        b = [0 0];
        c = [1 1];
        
        x0 = [max(a) 0];
        [t,x] = ode45(@(t,x) Toggle_asymmetric_ODE(t,x,a,b,c), [0 T_end], x0);
        xf1 = x(end,:);
        
        x0 = [0 max(a)];
        [t,x] = ode45(@(t,x) Toggle_asymmetric_ODE(t,x,a,b,c), [0 T_end], x0);
        xf2 = x(end,:);
        
        x_diff(i,j) = sqrt(sum((xf1-xf2).^2));
        
        
        [e,Y,Z,WRONG] = Error(a,b,T_end,Na);
        E_uncomp(i,j) = e;
        
        [error b_opt] = Balance(a,Na,Nb,T_end);
        E_comp(i,j) = error;
        By_comp(i,j) = b_opt(1);
        Bz_comp(i,j) = b_opt(2);
        
        x0 = [max(a) 0];
        [t,x] = ode45(@(t,x) Toggle_asymmetric_ODE(t,x,a,b_opt,c), [0 T_end], x0);
        xf1 = x(end,:);
        
        x0 = [0 max(a)];
        [t,x] = ode45(@(t,x) Toggle_asymmetric_ODE(t,x,a,b_opt,c), [0 T_end], x0);
        xf2 = x(end,:);
        
        x_diff_bal(i,j) = sqrt(sum((xf1-xf2).^2));
        
        
        
        
        
    end
    [i/row toc]
end

MASK_nobal = double(x_diff>ss_tol);
MASK_nobal(MASK_nobal==0) = NaN;

MASK_bal = double(x_diff_bal>ss_tol);
MASK_bal(MASK_bal==0) = NaN;

ai = 0:0.1:max(a_mid_vec);
di = 0:0.01:1;
[Ai,Di] = meshgrid(ai,di);


f = figure('Position',[100 100 1200 600]);



ax = subplot(2,4,1);
[C,h] = contourf(Ai,Di,interp2(A_mid,ASYM,100*E_uncomp.*MASK_nobal,Ai,Di),[0 5 10:10:50],'EdgeColor','none');
axis square
grid on
xlim([0 100])
ylim([0 1])
xlabel('\alpha_0')
ylabel('\delta_{\alpha}')
colormap(ax,othercolor('PuRd9'))
clabel(C,h,'manual','FontSize',FontSize,'FontWeight','bold')
set(gca,'XTick',[0:25:100],'XTickLabel',{0 '' '' '' 100},'YTick',[0:0.25:1],'YTickLabel',{0 '' '' '' 1})



ax = subplot(2,4,2);
[C,h] = contourf(Ai,Di,interp2(A_mid,ASYM,100*E_comp.*MASK_bal,Ai,Di),[0 5 10:10:50],'EdgeColor','none');
axis square
grid on
xlim([0 100])
ylim([0 1])
xlabel('\alpha_0')
ylabel('\delta_{\alpha}')
colormap(ax,othercolor('PuRd9'))
clabel(C,h,'manual','FontSize',FontSize,'FontWeight','bold')
set(gca,'XTick',[0:25:100],'XTickLabel',{0 '' '' '' 100},'YTick',[0:0.25:1],'YTickLabel',{0 '' '' '' 1})

set(findall(gcf,'-property','FontSize'),'FontSize',FontSize)






