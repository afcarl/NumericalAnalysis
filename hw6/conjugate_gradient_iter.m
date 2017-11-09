function [ x, error ] = conjugate_gradient_iter( A, x0, b, num_iters )
%CONJUGATE_GRADIENT Summary of this function goes here
%   Detailed explanation goes here
x=x0;
r0=b-A*x0;
d=r0;

for i=1:num_iters
    lambda = norm(r0)^2 / (transpose(d) * A * d);
    x = x + lambda * d;
    r = r0 - lambda * A * d;
    beta = norm(r)^2 / norm(r0)^2;
    error = norm(r);
    r0 = r;
    d = r + beta*d;
end

end

