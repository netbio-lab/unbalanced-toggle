function dV = Compute_dV(V)

[row,column] = size(V);
V1 = V(1:row-1,:);
V2 = V(2:row,:);

d = (V1-V2).^2;
dV = sum(d(:));