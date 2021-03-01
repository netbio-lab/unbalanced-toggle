function dx = Toggle_asymmetric_ODE(t,x,a,b,c)

dx = [0 ; 0];
y = x(1);
z = x(2);

ey = 1/(1+z^2);
ez = 1/(1+y^2);




dx(1) = a(1)*ey/(1 + b(1)*ey + b(2)*ez) - c(1)*y;
dx(2) = a(2)*ez/(1 + b(2)*ey + b(2)*ez) - c(2)*z;
