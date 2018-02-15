function [ lambda, v ] = Hw3_InversePower_Tran_Tu( A, x0, q, TOL )
%HW3_INVERSEPOWER_TRAN_TU Summary of this function goes here
%   Detailed explanation goes here
B = inv(A - q*eye(length(A)));

condition = true;
while condition
    y = B * x0;
    [~, i] = max(abs(y));
    u = y(i);
    v = y / u;
    condition = norm(v - x0, 2) >= TOL;
    x0 = v;
end

lambda = 1/u + q;
end