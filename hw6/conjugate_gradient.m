function [ x, num_iters ] = conjugate_gradient( A, x0, b, epsilon )
%CONJUGATE_GRADIENT Summary of this function goes here
%   Detailed explanation goes here
num_iters=0;
x=x0;
r0=b-A*x0;
d=r0;

while norm(r0) >= epsilon
    lambda = norm(r0)^2 / (transpose(d) * A * d);
    x = x + lambda * d;
    r = r0 - lambda * A * d;
    beta = norm(r)^2 / norm(r0)^2;
    r0 = r;
    d = r + beta*d;
    num_iters = num_iters + 1;
end

end

