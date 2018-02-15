%% MATLAB HW - Tu Tran

clc;
clear all;

% Question 1:
% The code is in file lu_decompose.m

% Question 2:
% The code is in file lusolve.m

% Question 3:

A = [1 10 0 3 -15;
    2 2/5 -1 2 1/2;
    100 -1 exp(1) -2 1/7;
    -pi 1 0 100 -7;
    1/2 -3 1 .1  1];

[L,U] = lu_decompose(A);

% (i)
b = [1; 1; 2; 0; -1];
x1 = lusolve(L, U, b)
% compare with the standard MATLAB way
x1_ = A\b

% (ii)
b = [-1; 0; 0; 17; 1];
x2 = lusolve(L, U, b)
% compare with the standard MATLAB way
x2_ = A\b