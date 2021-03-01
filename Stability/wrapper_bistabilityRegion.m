clear all
close all
clc


FontSize = 20;
LineWidth = 5;
colors = [255 44 121 ; 29 190 185 ; 167 48 220 ; 0 114 189 ; 241 90 41]/255;




T_end = 100;
threshold = 0.1;
N = 300;
ay_vec = logspace(0,2,N);
az_vec = logspace(0,2,N);
[Ay,Az] = meshgrid(ay_vec,az_vec);

b0 = sqrt((1+0)*(1+5));


figure('Position',[100 100 1200 600])


tic
subplot(2,4,1)
by = b0-1;
bz = b0-1;
S = BistableRegion(Ay,Az,by,bz,T_end,threshold);
index = find(S==1);
x = Ay(index);
y = Az(index);
j = boundary(x,y);
loglog(x(j),y(j))
title(['(\beta_y,\beta_z) = (' num2str(by) ',' num2str(bz) ')'],'FontWeight','normal')
toc

subplot(2,4,2)
by = 5;
bz = 0;
S = BistableRegion(Ay,Az,by,bz,T_end,threshold);
index = find(S==1);
x = Ay(index);
y = Az(index);
j = boundary(x,y);
loglog(x(j),y(j))
title(['(\beta_y,\beta_z) = (' num2str(by) ',' num2str(bz) ')'],'FontWeight','normal')


subplot(2,4,3)
by = 0;
bz = 5;
S = BistableRegion(Ay,Az,by,bz,T_end,threshold);
index = find(S==1);
x = Ay(index);
y = Az(index);
j = boundary(x,y);
loglog(x(j),y(j))
title(['(\beta_y,\beta_z) = (' num2str(by) ',' num2str(bz) ')'],'FontWeight','normal')


subplot(2,4,4)
by = 5;
bz = 5;
S = BistableRegion(Ay,Az,by,bz,T_end,threshold);
index = find(S==1);
x = Ay(index);
y = Az(index);
j = boundary(x,y);
loglog(x(j),y(j))
title(['(\beta_y,\beta_z) = (' num2str(by) ',' num2str(bz) ')'],'FontWeight','normal')


for i = 1:4
    subplot(2,4,i)
    xlim([1 100])
    ylim([1 100])
    axis square
    grid on
    xlabel('\alpha_y')
    ylabel('\alpha_z')
    set(gca,'XTick',[1:10 20:10:100],'XTickLabel',{1 '' '' '' '' '' '' '' '' 10 '' '' '' '' '' '' '' '' 100},'YTick',[1:10 20:10:100],'YTickLabel',{1 '' '' '' '' '' '' '' '' 10 '' '' '' '' '' '' '' '' 100})
end


set(findall(gcf,'-property','FontSize'),'FontSize',FontSize)












