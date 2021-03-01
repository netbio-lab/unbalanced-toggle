function [bistable Y Z ti] = Bistable(alpha,beta,N,T_end,N_rep)

ti = linspace(0,T_end,1e3);
c = 1;


Y = [];
Z = [];
for i = 1:N_rep
    x_init = geomean(alpha)*rand(1,2*N);
    [t,x] = ode45(@(t,x) ToggleNetwork_ODE(t,x,alpha,beta,N),[0 T_end], [x_init]);
    for j = 1:2*N
        X(j,:) = interp1(t,x(:,j),ti);
    end
    
    Y = [Y ; X(1:2:2*N,:)];
    Z = [Z ; X(2:2:2*N,:)];
end
Yf = Y(:,end);
Zf = Z(:,end);

dY = mean((Yf-mean(Yf)).^2);
dZ = mean((Yf-mean(Yf)).^2);

dX = sqrt(dY^2+dZ^2);

bistable = (dX > 1e-3);



