function dx = ToggleNetwork_ODE(t,x,alpha,beta,N)

dx = zeros(2*N,1);


for i=1:N
   y(i) = x(2*(i-1)+1); 
   z(i) = x(2*(i-1)+2);
   
   ey(i) = 1/(1+z(i)^2);
   ez(i) = 1/(1+y(i)^2);
end

load = beta(1)*sum(ey) + beta(2)*sum(ez);

for i = 1:N
    dx(2*(i-1)+1) = alpha(1)*ey(i)/(1 + load) - y(i);
    dx(2*(i-1)+2) = alpha(2)*ez(i)/(1 + load) - z(i);
end

