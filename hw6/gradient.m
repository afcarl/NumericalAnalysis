function [ x, num_iters ] = gradient( A, x0, b, epsilon )
%GRADIENT Summary of this function goes here
%   Detailed explanation goes here

num_iters=0;
x=x0;
r=b-A*x0;
while norm(r) >= epsilon
    lambda = (transpose(r) * r) / (transpose(r) * A * r);
    x = x + lambda*r;
    r = b - A*x;
    num_iters=num_iters + 1;
end
end

