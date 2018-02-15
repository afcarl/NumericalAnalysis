%% Main file
clc;
clear all;

% 1) The modified Gaussian elimination algorithm code
% is in the gauss_elim_partial_pivoting.m file

% 2) I have placed M after every for loop in both codes

% Example:

A = [2 3 4 5;
    34 56 78 1;
    23 0 1 2];

% Gaussian elimination without partial pivoting
gauss_elim_pivoting(A);

% Gaussian elimination with partial pivoting
gauss_elim_partial_pivoting(A);

% 3)

A = [1 10^5 0 3;
    0 2 -1 2;
    10^10 -1 0 -2;
    -10^(-8) 1 0 100];
b = [.000999; 1000.9999999; .00001; -1/3];

% using the Gaussian elimination with partial
% pivoting
gauss_elim_partial_pivoting(A)
    
% using the Matlab built in
x = A\b