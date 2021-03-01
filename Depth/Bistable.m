function answer = Bistable(a,b,T_end,threshold)


T_end = 1000;
[t,x] = ode45(@(time,x) ODE_toggle(time,x,a,b),[0 T_end], [a(1) 0]);
yf1 = x(length(t),1);
zf1 = x(length(t),2);
[t,x] = ode45(@(time,x) ODE_toggle(time,x,a,b),[0 T_end], [0 a(2)]);
yf2 = x(length(t),1);
zf2 = x(length(t),2);


answer = sqrt((yf1-yf2)^2+(zf1-zf2)^2)>threshold;