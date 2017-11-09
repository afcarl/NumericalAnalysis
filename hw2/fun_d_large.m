function [ sum ] = func_d_large( N )
%FUNC_2A Summary of this function goes here
%   Detailed explanation goes here
sum = 0;
for i = N:-1:1
   sum = sum + ((-1) ^ i)/i;
end

end