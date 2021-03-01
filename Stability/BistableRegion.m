function S = BistableRegion(Ay,Az,by,bz,T_end,threshold)


[row, column] = size(Ay);

for r = 1:row
    % r/row*100
    for c = 1:column
        ay = Ay(r,c);
        az = Az (r,c);

        x_init = [ay 0];
        [t,x] = ode45(@(time,x) Toggle_asymmetric_ODE(time,x,ay,az,by,bz),[0 T_end] , [x_init]);
        y1 = x(length(t),1);
        z1 = x(length(t),2);
        
        x_init = [0 az];
        [t,x] = ode45(@(time,x) Toggle_asymmetric_ODE(time,x,ay,az,by,bz),[0 T_end] , [x_init]);
        y2 = x(length(t),1);
        z2 = x(length(t),2);
        
        if sqrt((y1-y2)^2+(z1-z2)^2) > threshold
            S(r,c) = 1;
        else
            S(r,c) = 0;
        end
    end
end

