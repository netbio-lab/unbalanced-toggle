clear all
close all
clc


FontSize   = 20;
LineWidth  = 5;
MarkerSize = 20;
colors = [255 44 121 ; 29 190 185 ; 167 48 220 ; 0 114 189 ; 241 90 41]/255;







T_end = 100;
N_sample = 100; % 100
threshold = 0.01;
band = 0.1;


N = 10;
a = [10 15];
da = a(1)+(a(2)-a(1))/(N-1)*[0:N-1];
A = [a(1)*ones(1,N) da ; da a(2)*ones(1,N)]'; 
A(N,:) = [];


f = figure('Position',[100 100 1200 600]);

subplot(2,4,1)
plot(1:2*N-1,A(:,1),'Color',colors(1,:),'LineWidth',LineWidth)
hold on
plot(1:2*N-1,A(:,2),'Color',colors(2,:),'LineWidth',LineWidth)
plot(1:2*N-1,geomean(A'),'Color',colors(3,:),'LineWidth',LineWidth)
axis square
xlim([0 2*N])
ylim([0 2*N])
axis square
grid on

xlabel('toggle variant')
ylabel('\alpha_y and \alpha_z')
set(gca,'XTick',[0:5:20],'XTickLabel',{0 '' '' '' 20},'YTick',[0:5:20],'YTickLabel',{0 '' '' '' 20})


b = [0 0];
for i = 1:length(A)
    [b i/length(A)]
    a = A(i,:);
    d = Depth(a,b,T_end,threshold,band,N_sample);
    D(i,:) = d;
end
d0 = max(D(:));
D = D/d0;

for i = 2:4
    subplot(2,4,i)
    plot(1:2*N-1,D(:,1),'.','Color',colors(1,:),'MarkerSize',MarkerSize)
    hold on
    plot(1:2*N-1,D(:,2),'.','Color',colors(2,:),'MarkerSize',MarkerSize)
    
    axis square
    xlim([0 2*N])
    ylim([0 1])
    axis square
    grid on

    xlabel('toggle variant')
    ylabel('potential barriers')
    set(gca,'XTick',[0:5:20],'XTickLabel',{0 '' '' '' 20},'YTick',[0:0.25:1],'YTickLabel',{0 '' '' '' 1})
end


b = [0 1];
for i = 1:length(A)
    [b i/length(A)]
    a = A(i,:);
    d = Depth(a,b,T_end,threshold,band,N_sample);
    D(i,:) = d;
end
D = D/d0;
subplot(2,4,2)
plot(1:2*N-1,D(:,1),'Color',colors(1,:),'LineWidth',LineWidth)
plot(1:2*N-1,D(:,2),'Color',colors(2,:),'LineWidth',LineWidth)
title(['(\beta_y,\beta_z) = (' num2str(b(1)) ',' num2str(b(2)) ')'],'FontWeight','normal')

b = [1 0];
for i = 1:length(A)
    [b i/length(A)]
    a = A(i,:);
    d = Depth(a,b,T_end,threshold,band,N_sample);
    D(i,:) = d;
end
D = D/d0;
subplot(2,4,3)
plot(1:2*N-1,D(:,1),'Color',colors(1,:),'LineWidth',LineWidth)
plot(1:2*N-1,D(:,2),'Color',colors(2,:),'LineWidth',LineWidth)
title(['(\beta_y,\beta_z) = (' num2str(b(1)) ',' num2str(b(2)) ')'],'FontWeight','normal')


b = [1 1];
for i = 1:length(A)
    [b i/length(A)]
    a = A(i,:);
    d = Depth(a,b,T_end,threshold,band,N_sample);
    D(i,:) = d;
end
D = D/d0;
subplot(2,4,4)
plot(1:2*N-1,D(:,1),'Color',colors(1,:),'LineWidth',LineWidth)
plot(1:2*N-1,D(:,2),'Color',colors(2,:),'LineWidth',LineWidth)
title(['(\beta_y,\beta_z) = (' num2str(b(1)) ',' num2str(b(2)) ')'],'FontWeight','normal')


set(findall(gcf,'-property','FontSize'),'FontSize',FontSize)

