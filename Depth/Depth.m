function d = Depth(a,b,T_end,threshold,band,N_sample)

[slope bias] = Separatrix(a,b,T_end,threshold,N_sample);

if isnan(slope)
    d = [NaN NaN];
else
    yi = 0:max(a)/N_sample:max(a);
    zi = slope*yi + bias;
    zi1 = zi - band;
    zi2 = zi + band;

    positive_samples = find((yi>0) .* (zi1>0));

    y  = yi(positive_samples);
    z1 = zi1(positive_samples);
    z2 = zi2(positive_samples);

    for i = 1:length(y)
        [V yf zf ypz] = Potential_depth(a,b,[y(i) z1(i)],T_end,1000);
        V1(i)  = V;
        Yf1(i) = yf;
        Zf1(i) = zf;

        [V yf zf ypz] = Potential_depth(a,b,[y(i) z2(i)],T_end,1000);
        V2(i)  = V;
        Yf2(i) = yf;
        Zf2(i) = zf;
    end
    d = [min(V1) min(V2)];

    % figure()
    % hold on
    % plot(y,V1,'b')
    % plot(y,V2,'r')
    % grid on
end