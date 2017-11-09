function [ sum ] = func_d_small( N )
%FUNC_2A Summary of this function goes here
%   Detailed explanation goes here
sum = 0;
for i = 1:N
   sum = sum + ((-1) ^ i)/i;
end

end