function [e,Y,Z,WRONG] = Error(a,b,T_end,Na)

% y_vec = 0:max(a)/Na:max(a);
% z_vec = 0:max(a)/Na:max(a);



y_vec = 0:mean(a)/Na:mean(a);
z_vec = 0:mean(a)/Na:mean(a);


[Y,Z] = meshgrid(y_vec,z_vec);
[row,column] = size(Y);

for i = 1:row
    for j = 1:column
        [t,x] = ode45(@(t,x) Toggle_asymmetric_ODE(t,x,a,b,[1 1]), [0 T_end], [Y(i,j) Z(i,j)]);
        
        WRONG(i,j) = ((Y(i,j)>Z(i,j))+(x(end,1)>x(end,2)))==1;
        
        END(i,j) = x(end,1);
    end
end

% D_yz = abs(Y-Z)/mean(a);

% e = max([max(D_yz(WRONG==1)) 0]);

e = sum(double(WRONG(:)))/(row*column);

% figure()
% contourf(Y,Z,WRONG)