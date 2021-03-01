function b = binom(n,k)



if n<0
    b = 0;
elseif k>n
    b = 0;
else
    b = nchoosek(n,k);
end




