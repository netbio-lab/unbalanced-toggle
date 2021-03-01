clear all
close all
clc


T_end = 20;
x0 = [1 1.5];
a = [5 4];
b = [0 0];


[t,x] = ode45(@(t,x) Toggle_asymmetric_ODE(t,x,a,b,[1 1]), [0 T_end], x0);

figure()
plot(t,x(:,1),'r')
hold on
plot(t,x(:,2),'g')

        