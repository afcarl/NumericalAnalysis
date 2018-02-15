function [ lambda, v ] = Hw3_Power_Tran_Tu( A, x0, TOL )
%HW3_POWER_TRAN_TU Summary of this function goes here
%   Detailed explanation goes here

condition = true;
while condition
    y = A * x0;
    [~, i] = max(abs(y));
    lambda = y(i);
    v = y / lambda;
    condition = norm(v - x0, 2) >= TOL;
    x0 = v;
end
end