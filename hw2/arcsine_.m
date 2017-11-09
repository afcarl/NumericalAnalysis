function [ sum ] = arcsine_( N, x )
%ARCTAN_ Summary of this function goes here
%   Detailed explanation goes here
sum = 0;
for n=0:N
    sum = sum + 1/(2 ^ (2 * n)) * nchoosek(2 * n, n) ...
        * (x ^ (2 * n + 1))/(2 * n + 1);
end

end

