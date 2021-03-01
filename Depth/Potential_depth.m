function [V yf zf ypz] = Potential_depth(a,b,x0,T_end,N)

dt = T_end/N;

ti = 0:dt:T_end;


[t,x] = ode45(@(t,x) ODE_toggle(t,x,a,b), [0 T_end], x0);
y = x(:,1);
z = x(:,2);

yf = y(length(y));
zf = z(length(z));
ypz = yf/zf;

yi = interp1(t,y,ti);
zi = interp1(t,z,ti);

ey = 1./(1+zi.^2);
ez = 1./(1+yi.^2);

dydt = a(1)*ey./(1 + b(1)*ey + b(2)*ez) - yi;
dzdt = a(2)*ez./(1 + b(1)*ey + b(2)*ez) - zi;

V = sum(dydt.^2+dzdt.^2)*dt;










