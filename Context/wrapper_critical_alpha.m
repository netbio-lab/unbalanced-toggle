clear all
close all
clc



FontSize = 20;
LineWidth = 5;
colors = [255 44 121 ; 29 190 185 ; 167 48 220 ; 0 114 189 ; 241 90 41]/255;



N_rep = 100;
b = 1;
T_end = 50;



a0_vec = logspace(1,2,30);
a_vec  = logspace(0,1,30);
[A0,A] = meshgrid(a0_vec,a_vec);
[row,column] = size(A0);





figure('Position',[100 100 1200 900])






beta_vec = [1 2 5 10];

for k = 1:length(beta_vec)
    beta = [beta_vec(k) beta_vec(k)];
    for i = 1:row
        tic

        for j = 1:column
            alpha0 = A0(i,j);
            a0     = A(i,j);
            alpha = [alpha0/sqrt(a0) alpha0*sqrt(a0)];

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
        [100*k/length(beta_vec) 100*i/row toc]
    end
    N_crit{k} = n_crit;
end


for k = 1:length(beta_vec)
    ax = subplot(2,4,k);
    [C,h] = contourf(A0,A,N_crit{k},'EdgeColor','none');
    axis square
    xlabel('\alpha_0')
    ylabel('a')
    colormap(ax,othercolor('PuRd10'))
    set(gca,'XScale','log','YScale','log')
    set(gca,'XTick',[10:10:100],'XTickLabel',{10 '' 30 '' '' '' '' '' '' 100},'YTick',[1:1:10],'YTickLabel',{1 '' 3 '' '' '' '' '' '' 10})
    set(findall(gcf,'-property','FontSize'),'FontSize',FontSize)
    grid on
    shading interp
    clabel(C,h,'FontSize',FontSize/2)
end





