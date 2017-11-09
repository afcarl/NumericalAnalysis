function [ x ] = lusolve( L, U, b )
%LUSOLVE Summary of this function goes here
%   Detailed explanation goes here
y = forwardsolve(L, b);
x = backsolve(U, y);

end

