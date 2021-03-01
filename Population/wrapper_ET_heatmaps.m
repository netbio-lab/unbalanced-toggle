clear all
close all
clc


warning('off')

FontSize = 20;
LineWidth = 5;
colors = [255 44 121 ; 29 190 185 ; 167 48 220 ; 0 114 189 ; 241 90 41]/255;


thrE = 0.01;
N = 6;
p = linspace(1e-3,0.25,1e2);
[Py,Pz] = meshgrid(p,p);

for i = 1:length(p)
    for j = 1:length(p)
        [i j]
        py = Py(i,j);
        pz = Pz(i,j);
        [Eq,Er,Tq,Tr] = find_ET(py,pz,N,thrE);
        
        EQ(i,j) = Eq;
        ER(i,j) = Er;

        TQ(i,j) = Tq;
        TR(i,j) = Tr;
    end
end


figure('Position',[100 100 1200 600])

ax = subplot(2,4,1);
[C,h] = contourf(Py,Pz,EQ,[0:0.01:1],'EdgeColor','none');
colormap(ax,othercolor('GreenRed'))


ax = subplot(2,4,2);
[C,h] = contourf(Py,Pz,ER,[0:0.01:1],'EdgeColor','none');
colormap(ax,othercolor('GreenRed'))

ax = subplot(2,4,3);
[C,h] = contourf(Py,Pz,TQ,[0:10:100],'EdgeColor','none');
colormap(ax,othercolor('GreenRed'))


ax = subplot(2,4,4);
[C,h] = contourf(Py,Pz,TR,[0:10:100],'EdgeColor','none');
colormap(ax,othercolor('GreenRed'))





xlim([0 0.2])
ylim([0 0.2])
axis square
grid on
xlabel('p_y')
ylabel('p_z')
%set(gca,'XTick',[0:0.25:1],'XTickLabel',{0 '' '' '' 1},'YTick',[0:0.25:1],'YTickLabel',{0 '' '' '' 1})
set(findall(gcf,'-property','FontSize'),'FontSize',FontSize)




