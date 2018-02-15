function [ x, num_iters ] = newton_modified( f, fprime, epsilon, x0, max_iters )
%NEWTON_MODIFIED Summary of this function goes here
%   Detailed explanation goes here
num_iters = 0;
x = x0;

while abs(f(x)) > epsilon && num_iters < max_iters
    num_iters = num_iters + 1;
    x = x - (3 * f(x)) / fprime(x);
end

end

