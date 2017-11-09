function [ sum ] = sum_large( N, power )
%FUNC_2A Summary of this function goes here
%   Detailed explanation goes here
sum = 0;
for i = N:-1:1
   sum = sum + 1/(i ^ power);
end

end