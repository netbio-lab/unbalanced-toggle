function [error b_opt] = Balance(a,Na,Nb,T_end)


bmax = mean(a)/2-1;
b_vec = 0:bmax/Nb:bmax; 
[By,Bz] = meshgrid(b_vec,b_vec);
[row,column] = size(By);

e_b = [];
for i = 1:row
    for j = 1:column
        b = [By(i,j) Bz(i,j)];
        e_b(i,j) = Error(a,b,T_end,Na);
    end
end

if isempty(e_b)
    error = NaN;
    b_opt = [NaN NaN];
else
    [val ind] = min(e_b(:));

    error = val;
    b_opt = [By(ind) Bz(ind)];
end
