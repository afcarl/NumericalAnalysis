function [ sum ] = sum_small( N, power )
%FUNC_2A Summary of this function goes here
%   Detailed explanation goes here
sum = 0;
for i = 1:N
   sum = sum + 1/(i ^ power);
end

end