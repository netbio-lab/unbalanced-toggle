
clear all
close all
clc

FontSize = 20;

da = 1.15;
a0 = 10;
a = [a0/sqrt(da) a0*sqrt(da)];
b = [0 0];

N = 100;
T_end = 100;
N_time = 1000;


y_vector = 0:1.5*a/(N-1):1.5*a;
z_vector = y_vector;
[Y Z] = meshgrid(y_vector, z_vector);
Y = Y+rand(N)*1e-4;
Z = Z+rand(N)*1e-4;

for i = 1:N
    100*i/N
    for j = 1:N
        [v yf zf ypz] = Potential_asymmetric(a(1),a(2),b(1),b(2),[Y(i,j) Z(i,j)],T_end,N_time);
        V(i,j) = v;
        R(i,j) = ypz;
    end
end
V = V+1e1;
idx = kmeans(R(:),2);

[row,column] = size(V);
shift_vec = linspace(-1e1,1e1,1e4);
for i = 1:length(shift_vec)
    shift = shift_vec(i);
    V_new(idx==1) = V(idx==1) + shift;
    V_new(idx==2) = V(idx==2);
    
    dV(i) = Compute_dV(reshape(V_new,row,column));
end
[dV_min opt_shift_idx] = min(dV);
opt_shift = shift_vec(opt_shift_idx);

%opt_shift = -4;
V_new(idx==1) = V(idx==1) + opt_shift;
V_new(idx==2) = V(idx==2);
V_new = reshape(V_new,row,column);

V_new = V;
ax = figure()
surf(Y,Z,log10(V_new),'FaceAlpha',0.75,'EdgeColor','none')
view([10 10])
xlabel('y')
ylabel('z')
zlabel('V')
axis square
zlim([1 2])
xlim([0 15])
ylim([0 15])
% title('\beta = 0')
% colormap(ax,othercolor('BuGy_8'))

set(gca,'XTick',[0:5:15],'XTickLabel',{0 '' '' 15},'YTick',[0:5:15],'YTickLabel',{0 '' '' 15},'ZTick',[0.5:0.25:2],'ZTickLabel',{'' '' '' '' ''})
set(findall(gcf,'-property','FontSize'),'FontSize',FontSize)
set(gcf,'renderer','Painters')


