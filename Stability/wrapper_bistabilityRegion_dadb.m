clear all
close all
clc


FontSize = 20;
LineWidth = 5;
colors = [255 44 121 ; 29 190 185 ; 167 48 220 ; 0 114 189 ; 241 90 41]/255;




T_end = 100;
threshold = 0.1;
N = 300;

a0_vec = logspace(0,2,N);
da_vec = linspace(1,10,N);

[A0,dA] = meshgrid(a0_vec,da_vec);

Ay = A0./sqrt(dA);
Az = A0.^2./Ay;

b = [0 2 5 10];


figure('Position',[100 100 1200 600])



for i = 1:4
    
    subplot(2,4,i)
    S = BistableRegion(Ay,Az,b(i),b(i),T_end,threshold);
    index = find(S==1);
    x = A0(index);
    y = dA(index);
    j = boundary(x,y);
    loglog(x(j),y(j))
    xlim([1 100])
    ylim([1 10])
    axis square
    grid on
    xlabel('\alpha_0')
    ylabel('a')
    title(['\beta_y = \beta_z = ' num2str(b(i))],'FontWeight','normal')
    set(gca,'XTick',[1 10 100],'XTickLabel',{1 10 100},'YTick',[1:1:10],'YTickLabel',{1 '' 3 '' '' '' '' '' '' 10})
end

alpha = [5 10 20 50];
for k = 1:4
    subplot(2,4,4+k)
    b0 = alpha(k)/2;

    loglog(0,0)
    patch([1 b0 b0 1],[1e-1 1e-1 1e1 1e1],'r')
    xlim([1e0 1e2])
    ylim([1e-1 1e1])
    axis square
    grid on
    xlabel('\beta_0')
    ylabel('b')
    set(gca,'XTick',[1:10 20:10:100],'XTickLabel',{1 '' '' '' '' '' '' '' '' 10 '' '' '' '' '' '' '' '' 100},'YTick',[0.1:0.1:1 2:1:10],'YTickLabel',{0.1 '' '' '' '' '' '' '' '' 1 '' '' '' '' '' '' '' '' 10})
    title(['\alpha_y = \alpha_z = ' num2str(alpha(k))],'FontWeight','normal')
end




set(findall(gcf,'-property','FontSize'),'FontSize',FontSize)
set(gcf,'renderer','Painters')



