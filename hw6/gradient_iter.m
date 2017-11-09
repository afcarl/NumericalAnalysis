function [ x, error ] = gradient_iter( A, x0, b, num_iters )
%GRADIENT Summary of this function goes here
%   Detailed explanation goes here

x=x0;
r=b-A*x0;

for i=1:num_iters
    error = norm(r);
    lambda = (transpose(r) * r) / (transpose(r) * A * r);
    x = x + lambda*r;
    r = b - A*x;
end
end

