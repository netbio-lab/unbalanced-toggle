function [slope bias] = Separatrix(a,b,T_end,threshold,N_sample)


answer = Bistable(a,b,T_end,threshold);
if answer
    N = N_sample;
    y_vector = 0:a(1)/(N-1):a(1);
    z_vector = 0:a(2)/(N-1):a(2);
    [Y Z] = meshgrid(y_vector, z_vector);
    Y = Y+rand(N)*1e-4;
    Z = Z+rand(N)*1e-4;

    for i = 1:N
        for j = 1:N
            [t,x] = ode45(@(time,x) ODE_toggle(time,x,a,b),[0 T_end], [Y(i,j) Z(i,j)]);
            yf = x(length(t),1);
            zf = x(length(t),2);
            
        
            Yf(i,j)  = yf;
            Zf(i,j)  = zf;
        end
    end
    predictor = [Y(:) Z(:)];
    label = kmeans([Yf(:) Zf(:)],2);
    
    
    Mdl = fitclinear(predictor,label);
    slope = -Mdl.Beta(1)/Mdl.Beta(2);
    bias = -Mdl.Bias/Mdl.Beta(2);


else
    slope = NaN;
    bias  = NaN;
end