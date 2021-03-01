function [Q R] = find_QR(py,pz,N)


% i is the row index of the target
% j is the column index of the target
% k is the running index in the previous row


Q = zeros(N,2^N/2+1);
R = zeros(N,2^N/2+1);



Q(1,1) = 1;
Q(1,2) = 0;

R(1,1) = 0;
R(1,2) = 1;
for i = 2:N 
   for j = 1:2^(i-1)+1 
       y_current = 2*(j-1);
       y_star    = y_current/2;
       for k = 1:2^(i-2)+1
           y_prev = 2*(k-1);
           p_trans = 0;
           for n = 0:y_star
               m = y_star-n;
               p_trans = p_trans + binom(y_prev,n)*(1-py)^n*py^(y_prev-n)*binom(2^(i-1)-y_prev,m)*pz^m*(1-pz)^(2^(i-1)-y_prev-m);
           end
           Q(i,j) = Q(i,j) + p_trans*Q(i-1,k);
           R(i,j) = R(i,j) + p_trans*R(i-1,k);
       end
   end
end