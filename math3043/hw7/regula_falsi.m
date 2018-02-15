function [ x, num_iters ] = regula_falsi( f, epsilon, max_iters, a, b )
%REGULA_FALSI Summary of this function goes here
%   Detailed explanation goes here
num_iters = 0;
x = 0;

while abs(b - a) > epsilon && num_iters < max_iters
    fa = f(a);
    fb = f(b);

    x = b - fb * (b - a)/(fb - fa);
    if f(x) * f(a) < 0
        b = x;
    elseif f(x) * f(b) < 0
        a = x;
    else
        break
    end
    num_iters = num_iters + 1;
end

