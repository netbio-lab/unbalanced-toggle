function dx = Toggle_asymmetric_ODE(t,x,ay,az,by,bz)

dx = [0 ; 0];
y = x(1);
z = x(2);

ey = 1/(1+z^2);
ez = 1/(1+y^2);

dx(1) = ay*ey/(1 + by*ey + bz*ez) - y;
dx(2) = az*ez/(1 + by*ey + bz*ez) - z;
