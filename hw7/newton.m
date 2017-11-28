function [ x, num_iters ] = newton( f, fprime, epsilon, x0, max_iters )
%NEWTON Summary of this function goes here
%   Detailed explanation goes here
num_iters = 0;
x = x0;

while abs(f(x)) > epsilon && num_iters < max_iters
    num_iters = num_iters + 1;
    x = x - f(x) / fprime(x);
end

end

