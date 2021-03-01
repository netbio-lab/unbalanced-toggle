clear all
close all
clc


warning('off')

FontSize = 20;
LineWidth = 5;
MarkerSize = 20;
colors = [255 44 121 ; 29 190 185 ; 167 48 220 ; 0 114 189 ; 241 90 41]/255;





figure('Position',[100 100 1200 600])
for i = 1:4
    subplot(2,4,i)
    plot(0,0)
    hold on
    axis square
    grid on
end



xi = linspace(0,1,1e3);
N  = 6;
N_step = 10;
step = [0:N_step]*5;


py3 = [0.02 0.1 0.1];
pz3 = [0.2 0.05 0.15];



% FIRST
[Q R] = find_QR(py3(1),pz3(1),N);
qi = interp1([0:2:2^N]/2^N,Q(N,:),xi);
ri = interp1([0:2:2^N]/2^N,R(N,:),xi);
Qi = qi/trapz(xi,qi);
Ri = ri/trapz(xi,ri);
EQ(1) = 0;
ER(1) = 1;
for j = 2:N_step+1
    EQ(j) = mean(xi.*(EQ(j-1)*Ri + (1-EQ(j-1))*Qi));
    ER(j) = mean(xi.*(ER(j-1)*Ri + (1-ER(j-1))*Qi));
end

subplot(2,4,1)
plot(100*xi,Qi,'Color',colors(1,:),'LineWidth',LineWidth)

subplot(2,4,2)
plot(100*xi,Ri,'Color',colors(1,:),'LineWidth',LineWidth)

subplot(2,4,3)
plot(step,100*EQ,'Color',colors(1,:),'LineWidth',LineWidth)

subplot(2,4,4)
plot(step,100*ER,'Color',colors(1,:),'LineWidth',LineWidth)



% SECOND
[Q R] = find_QR(py3(2),pz3(2),N);
qi = interp1([0:2:2^N]/2^N,Q(N,:),xi);
ri = interp1([0:2:2^N]/2^N,R(N,:),xi);
Qi = qi/trapz(xi,qi);
Ri = ri/trapz(xi,ri);
EQ(1) = 0;
ER(1) = 1;
for j = 2:N_step+1
    EQ(j) = mean(xi.*(EQ(j-1)*Ri + (1-EQ(j-1))*Qi));
    ER(j) = mean(xi.*(ER(j-1)*Ri + (1-ER(j-1))*Qi));
end

subplot(2,4,1)
plot(100*xi,Qi,'Color',colors(2,:),'LineWidth',LineWidth)

subplot(2,4,2)
plot(100*xi,Ri,'Color',colors(2,:),'LineWidth',LineWidth)

subplot(2,4,3)
plot(step,100*EQ,'Color',colors(2,:),'LineWidth',LineWidth)

subplot(2,4,4)
plot(step,100*ER,'Color',colors(2,:),'LineWidth',LineWidth)


% THIRD
[Q R] = find_QR(py3(3),pz3(3),N);
qi = interp1([0:2:2^N]/2^N,Q(N,:),xi);
ri = interp1([0:2:2^N]/2^N,R(N,:),xi);
Qi = qi/trapz(xi,qi);
Ri = ri/trapz(xi,ri);
EQ(1) = 0;
ER(1) = 1;
for j = 2:N_step+1
    EQ(j) = mean(xi.*(EQ(j-1)*Ri + (1-EQ(j-1))*Qi));
    ER(j) = mean(xi.*(ER(j-1)*Ri + (1-ER(j-1))*Qi));
end

subplot(2,4,1)
plot(100*xi,Qi,'Color',colors(3,:),'LineWidth',LineWidth)

subplot(2,4,2)
plot(100*xi,Ri,'Color',colors(3,:),'LineWidth',LineWidth)

subplot(2,4,3)
plot(step,100*EQ,'Color',colors(3,:),'LineWidth',LineWidth)

subplot(2,4,4)
plot(step,100*ER,'Color',colors(3,:),'LineWidth',LineWidth)





load ET.mat





subplot(2,4,1)
xlabel('y_i (%)')
ylabel('q_i(y_i)')
title('Y_0 = 0')
ylim([0 10])
set(gca,'XTick',[0:25:100],'XTickLabel',{0 '' '' '' 100},'YTick',[0:2:10],'YTickLabel',{0 '' '' '' '' 10})

subplot(2,4,2)
xlabel('y_i (%)')
ylabel('r_i(y_i)')
title('Y_0 = 1')
ylim([0 10])
set(gca,'XTick',[0:25:100],'XTickLabel',{0 '' '' '' 100},'YTick',[0:2:10],'YTickLabel',{0 '' '' '' '' 10})

subplot(2,4,3)
xlabel('generation')
ylabel('mean Y_i (%)')
title('Y_0 = 0')
ylim([0 100])
set(gca,'XTick',[0:10:50],'XTickLabel',{0 '' '' '' '' 50},'YTick',[0:25:100],'YTickLabel',{0 '' '' '' 100})

subplot(2,4,4)
xlabel('generation')
ylabel('mean Y_i (%)')
title('Y_0 = 1')
ylim([0 100])
set(gca,'XTick',[0:10:50],'XTickLabel',{0 '' '' '' '' 50},'YTick',[0:25:100],'YTickLabel',{0 '' '' '' 100})






ax = subplot(2,4,5);
[C1,h1] = contourf(Py,Pz,100*EQ,100*[0:0.1:1],'EdgeColor','none');  
title('Y_0 = 0')

ax = subplot(2,4,6);
[C2,h2] = contourf(Py,Pz,100*ER,100*[0:0.1:1],'EdgeColor','none');
title('Y_0 = 1')

ax = subplot(2,4,7);
[C3,h3] = contourf(Py,Pz,TQ,[0:10:100],'EdgeColor','none');
title('Y_0 = 0')

ax = subplot(2,4,8);
[C4,h4] = contourf(Py,Pz,TR,[0:10:100],'EdgeColor','none');
title('Y_0 = 1')

for i = 5:8
    ax = subplot(2,4,i);
    hold on
    colormap(ax,othercolor('Blues9'))
    for j = 1:3
       plot(py3(j),pz3(j),'.','Color',colors(j,:),'MarkerSize',MarkerSize) 
    end
    axis square
    grid on
    xlabel('p_y')
    ylabel('p_z')
    xlim([0 0.25])
    ylim([0 0.25])
    set(gca,'XTick',[0:0.05:0.25],'XTickLabel',{0 '' '' '' '' 0.25},'YTick',[0:0.05:0.25],'YTickLabel',{0 '' '' '' '' 0.25})

end  

set(findall(gcf,'-property','FontSize'),'FontSize',FontSize)




clabel(C1,h1,'manual','Rotation',0)
clabel(C2,h2,'manual','Rotation',0)
clabel(C3,h3,'manual','Rotation',0)
clabel(C4,h4,'manual','Rotation',0)


set(gcf,'renderer','Painters')