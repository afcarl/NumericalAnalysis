function [ x, num_iters ] = bisection( f, epsilon, max_iters, a, b )
%BISECTION Summary of this function goes here
%   Detailed explanation goes here
num_iters = 0;
x = 0;

while num_iters < max_iters && abs(b - a) > epsilon
    num_iters = num_iters + 1;
    x = (a + b) / 2;
    if f(x) * f(a) < 0
        b = x;
    elseif f(x) * f(b) < 0
        a = x;
    else
        break
    end
end

end

