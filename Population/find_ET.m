function [Eq,Er,Tq,Tr,EQ,ER] = find_ET(py,pz,N,thrE)




xi = linspace(0,1,1e3);
[Q R] = find_QR(py,pz,N);
qi = interp1([0:2:2^N]/2^N,Q(N,:),xi);
ri = interp1([0:2:2^N]/2^N,R(N,:),xi);
Qi = qi/trapz(xi,qi);
Ri = ri/trapz(xi,ri);



EQ(1) = 0;
ER(1) = 1;



stop = 0;
Q_stop = 0;
R_stop = 0;
j = 1;
while ~stop
    j = j+1;
    EQ(j) = mean(xi.*(EQ(j-1)*Ri + (1-EQ(j-1))*Qi));
    ER(j) = mean(xi.*(ER(j-1)*Ri + (1-ER(j-1))*Qi));
    
    dEQ = abs(EQ(j)-EQ(j-1));
    dER = abs(ER(j)-ER(j-1));

    if (dEQ<thrE) & ~Q_stop 
        Tq = j*(N-1);
        Q_stop = 1;
    end
    
    if (dER<thrE) & ~R_stop 
        Tr = j*(N-1);
        R_stop = 1;
    end
    
    stop = Q_stop*R_stop;
end
Eq = EQ(end);
Er = ER(end);










