function [ sum ] = arctan_( N, x )
%ARCTAN_ Summary of this function goes here
%   Detailed explanation goes here
sum = 0;
for n=0:N
    sum = sum + ((-1) ^ n * x ^ (2 * n + 1))/(2 * n + 1);
end

end