function s = Bistable(alpha,beta,T_end,threshold)



x_init = [alpha(1) 0];
[t,x] = ode45(@(time,x) Toggle_asymmetric_ODE(time,x,alpha(1),alpha(2),beta(1),beta(2)),[0 T_end] , [x_init]);
y1 = x(length(t),1);
z1 = x(length(t),2);

x_init = [0 alpha(2)];
[t,x] = ode45(@(time,x) Toggle_asymmetric_ODE(time,x,alpha(1),alpha(2),beta(1),beta(2)),[0 T_end] , [x_init]);
y2 = x(length(t),1);
z2 = x(length(t),2);

if sqrt((y1-y2)^2+(z1-z2)^2) > threshold
    s = 1;
else
    s = 0;
end



