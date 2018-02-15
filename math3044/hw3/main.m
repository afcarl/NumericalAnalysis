%% Homework 3 - Tu Tran
clc;
clear all;

format short;

% Power Method
% Test matrix
A = [-2 -2 3;
    -10 1 6;
    10 -2 -9];
x = [1; 0; 0];

[lambda, v] = Hw3_Power_Tran_Tu(A, x, 1e-5)

% Inverse Power Method
q = 3;
A = [12 1 1 0 3;
    1 3 0 1 0;
    1 0 -6 2 1;
    0 2 1 9 0;
    1 0 1 0 -2];
x = transpose([1 0 0 0 0]);
[lambda, v] = Hw3_InversePower_Tran_Tu(A, x, q, 1e-10)