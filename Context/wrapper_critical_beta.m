clear all
close all
clc



FontSize = 20;
LineWidth = 5;
colors = [255 44 121 ; 29 190 185 ; 167 48 220 ; 0 114 189 ; 241 90 41]/255;



N_rep = 10;     % 100, only 20
b = 1;
T_end = 50;



db_vec = logspace(-1,1,100); % 20 instead of 30
b0_vec = logspace(0,2,100);  % 25 instead of 30
[B0,dB] = meshgrid(b0_vec,db_vec);
By = B0.*sqrt(dB)-1
Bz = B0./sqrt(dB)-1

figure('Position',[100 100 1200 900])
subplot(2,4,1)
loglog(B0(By<0),dB(By<0),'.')
xlim([1 100])
ylim([0.1 10])
axis square
grid on





figure('Position',[100 100 1200 900])






alpha_vec = [5 10 20 50];
[row,column] = size(By);
for k = 1:length(alpha_vec)
    alpha = [alpha_vec(k) alpha_vec(k)];
    for i = 1:row
        tic

        for j = 1:column
            
            beta  = [By(i,j) Bz(i,j)];
            
            if ~prod(beta) | sum(beta<0)
                n_crit(i,j) = Inf;
            else
                stop = 0;
                crit = 0;
                while ~stop
                   crit = crit+1;
                   N = crit;
                   [bistable Y Z ti] = Bistable(alpha,beta,N,T_end,N_rep);
                   if bistable
                       stop = 0;
                   else 
                       stop = 1;
                   end
                end
                n_crit(i,j) = N;
            end
        end
        [100*k/length(alpha_vec) 100*i/row toc]
    end
    N_crit{k} = n_crit;
end


for k = 1:length(alpha_vec)
    ax = subplot(2,4,k);
    [C,h] = contourf(B0,dB,N_crit{k},'EdgeColor','none');
    axis square
    xlabel('\beta_0')
    ylabel('b')
    colormap(ax,othercolor('PuRd10'))
    set(gca,'XScale','log','YScale','log')
    %set(gca,'XTick',[10:10:100],'XTickLabel',{10 '' 30 '' '' '' '' '' '' 100},'YTick',[1:1:10],'YTickLabel',{1 '' 3 '' '' '' '' '' '' 10})
    set(findall(gcf,'-property','FontSize'),'FontSize',FontSize)
    grid on
    shading interp
    clabel(C,h,'FontSize',FontSize/2)
end




