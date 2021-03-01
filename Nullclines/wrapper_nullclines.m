clear all
close all
clc


FontSize = 20;
LineWidth = 5;
colors = [255 44 121 ; 29 190 185 ; 167 48 220 ; 0 114 189 ; 241 90 41]/255;


grey = [102 102 102]/255;


Xlim      = [0.1 10]; 
Ylim      = [0.1 10]; 
XTick     = [0.1 1 10]; 
YTick     = XTick; 
XTickLabel = {1 1 10};
YTickLabel = {1 1 10};
resolution = 0.001;

a1       = 1;
a2       = 1.2;
b       = 1;
c       = 1;

alpha1   = 10;
alpha2   = 1;
beta1     = 1;
beta2    = 10;

dummy   = 0:resolution:Xlim(2);

zL = @(a) a - sqrt(a^2-1);
zU = @(a) a + sqrt(a^2-1);
y  = @(z,a,s) ((1+z.^2)+s*sqrt((1+z.^2).^2 - 4*a^2*z.^2))./(2*a*z);






f = figure('Position',[100 100 1200 600]);




subplot(2,4,1)
a = a1;
alpha = alpha1;
beta = beta1;
loglog(0,0)
hold on
Z1 = 0:resolution:zL(a);
Z2 = zU(a):resolution:Xlim(2);
plot(dummy,dummy,'k:','LineWidth',LineWidth/4)
plot(dummy,1./dummy,'k:','LineWidth',LineWidth/4)
loglog([y(Z1,a,-1) fliplr(y(Z1,a,+1))],[Z1 fliplr(Z1)],'Color',grey,'LineWidth',LineWidth/2)
loglog([fliplr(y(Z2,a,-1)) y(Z2,a,+1)],[fliplr(Z2) Z2],'Color',grey,'LineWidth',LineWidth/2)
Y = dummy;
A = alpha/(b*beta)*1./(1+Y.^2);
B = 1/(b*beta)*(1+beta./(1+Y.^2));
for i = 1:length(Y)
    p = [B(i) -A(i) B(i)+1 -A(i)];
    r(:,i) = roots(p);
    [value index] = sort(abs(imag(r(:,i))));
    r_sorted(:,i)  = r(index,i);
end;
loglog(Y,r_sorted(1,:),'Color',colors(4,:),'LineWidth',LineWidth)
Z = dummy;
A = a*alpha/beta*1./(1+Z.^2);
B = 1/(beta)*(1+b*beta./(1+Z.^2));
for i = 1:length(Z)
    p = [B(i) -A(i) B(i)+1 -A(i)];
    r(:,i) = roots(p);
    [value index] = sort(abs(imag(r(:,i))));
    r_sorted(:,i)  = r(index,i);
end;
loglog(r_sorted(1,:),Z,'Color',colors(5,:),'LineWidth',LineWidth)
grid on
xlabel('y')
ylabel('z')
grid on
axis square
title(['(\alpha_y,\alpha_z) = (' num2str(a*alpha) ',' num2str(alpha) ')'],'FontWeight','normal')
xlim(Xlim)
ylim(Ylim)
set(gca,'XTick',XTick,'XTickLabel',XTickLabel,'YTick',YTick,'YTickLabel',YTickLabel)










subplot(2,4,2)
a = a1;
alpha = alpha1;
beta = beta2;
loglog(0,0)
hold on
Z1 = 0:resolution:zL(a);
Z2 = zU(a):resolution:Xlim(2);
plot(dummy,dummy,'k:','LineWidth',LineWidth/4)
plot(dummy,1./dummy,'k:','LineWidth',LineWidth/4)
loglog([y(Z1,a,-1) fliplr(y(Z1,a,+1))],[Z1 fliplr(Z1)],'Color',grey,'LineWidth',LineWidth/2)
loglog([fliplr(y(Z2,a,-1)) y(Z2,a,+1)],[fliplr(Z2) Z2],'Color',grey,'LineWidth',LineWidth/2)
Y = dummy;
A = alpha/(b*beta)*1./(1+Y.^2);
B = 1/(b*beta)*(1+beta./(1+Y.^2));
for i = 1:length(Y)
    p = [B(i) -A(i) B(i)+1 -A(i)];
    r(:,i) = roots(p);
    [value index] = sort(abs(imag(r(:,i))));
    r_sorted(:,i)  = r(index,i);
end;
loglog(Y,r_sorted(1,:),'Color',colors(4,:),'LineWidth',LineWidth)
Z = dummy;
A = a*alpha/beta*1./(1+Z.^2);
B = 1/(beta)*(1+b*beta./(1+Z.^2));
for i = 1:length(Z)
    p = [B(i) -A(i) B(i)+1 -A(i)];
    r(:,i) = roots(p);
    [value index] = sort(abs(imag(r(:,i))));
    r_sorted(:,i)  = r(index,i);
end;
loglog(r_sorted(1,:),Z,'Color',colors(5,:),'LineWidth',LineWidth)
grid on
xlabel('y')
ylabel('z')
grid on
axis square
title(['(\alpha_y,\alpha_z) = (' num2str(a*alpha) ',' num2str(alpha) ')'],'FontWeight','normal')
xlim(Xlim)
ylim(Ylim)
set(gca,'XTick',XTick,'XTickLabel',XTickLabel,'YTick',YTick,'YTickLabel',YTickLabel)




subplot(2,4,5)
a = a2;
alpha = alpha1;
loglog(0,0)
hold on
Z1 = 0:resolution:zL(a);
Z2 = zU(a):resolution:Xlim(2);
plot(dummy,dummy,'k:','LineWidth',LineWidth/4)
plot(dummy,1./dummy,'k:','LineWidth',LineWidth/4)
loglog([y(Z1,a,-1) fliplr(y(Z1,a,+1))],[Z1 fliplr(Z1)],'Color',grey,'LineWidth',LineWidth/2)
loglog([fliplr(y(Z2,a,-1)) y(Z2,a,+1)],[fliplr(Z2) Z2],'Color',grey,'LineWidth',LineWidth/2)
Y = dummy;
A = alpha/(b*beta)*1./(1+Y.^2);
B = 1/(b*beta)*(1+beta./(1+Y.^2));
for i = 1:length(Y)
    p = [B(i) -A(i) B(i)+1 -A(i)];
    r(:,i) = roots(p);
    [value index] = sort(abs(imag(r(:,i))));
    r_sorted(:,i)  = r(index,i);
end;
loglog(Y,r_sorted(1,:),'Color',colors(4,:),'LineWidth',LineWidth)
Z = dummy;
A = a*alpha/beta*1./(1+Z.^2);
B = 1/(beta)*(1+b*beta./(1+Z.^2));
for i = 1:length(Z)
    p = [B(i) -A(i) B(i)+1 -A(i)];
    r(:,i) = roots(p);
    [value index] = sort(abs(imag(r(:,i))));
    r_sorted(:,i)  = r(index,i);
end;
loglog(r_sorted(1,:),Z,'Color',colors(5,:),'LineWidth',LineWidth)
grid on
xlabel('y')
ylabel('z')
grid on
axis square
title(['(\alpha_y,\alpha_z) = (' num2str(a*alpha) ',' num2str(alpha) ')'],'FontWeight','normal')
xlim(Xlim)
ylim(Ylim)
set(gca,'XTick',XTick,'XTickLabel',XTickLabel,'YTick',YTick,'YTickLabel',YTickLabel)











subplot(2,4,6)
a = a2;
alpha = alpha2;
loglog(0,0)
hold on
Z1 = 0:resolution:zL(a);
Z2 = zU(a):resolution:Xlim(2);
plot(dummy,dummy,'k:','LineWidth',LineWidth/4)
plot(dummy,1./dummy,'k:','LineWidth',LineWidth/4)
loglog([y(Z1,a,-1) fliplr(y(Z1,a,+1))],[Z1 fliplr(Z1)],'Color',grey,'LineWidth',LineWidth/2)
loglog([fliplr(y(Z2,a,-1)) y(Z2,a,+1)],[fliplr(Z2) Z2],'Color',grey,'LineWidth',LineWidth/2)
Y = dummy;
A = alpha/(b*beta)*1./(1+Y.^2);
B = 1/(b*beta)*(1+beta./(1+Y.^2));
for i = 1:length(Y)
    p = [B(i) -A(i) B(i)+1 -A(i)];
    r(:,i) = roots(p);
    [value index] = sort(abs(imag(r(:,i))));
    r_sorted(:,i)  = r(index,i);
end;
loglog(Y,r_sorted(1,:),'Color',colors(4,:),'LineWidth',LineWidth)
Z = dummy;
A = a*alpha/beta*1./(1+Z.^2);
B = 1/(beta)*(1+b*beta./(1+Z.^2));
for i = 1:length(Z)
    p = [B(i) -A(i) B(i)+1 -A(i)];
    r(:,i) = roots(p);
    [value index] = sort(abs(imag(r(:,i))));
    r_sorted(:,i)  = r(index,i);
end;
loglog(r_sorted(1,:),Z,'Color',colors(5,:),'LineWidth',LineWidth)
grid on
xlabel('y')
ylabel('z')
grid on
axis square
title(['(\alpha_y,\alpha_z) = (' num2str(a*alpha) ',' num2str(alpha) ')'],'FontWeight','normal')
xlim(Xlim)
ylim(Ylim)
set(gca,'XTick',XTick,'XTickLabel',XTickLabel,'YTick',YTick,'YTickLabel',YTickLabel)
















set(findall(gcf,'-property','FontSize'),'FontSize',FontSize)


set(gcf,'renderer','Painters')


