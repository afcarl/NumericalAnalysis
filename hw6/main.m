%% Tu Tran - Matlab Homework 6


%% Gradient Descent

clc;
clear all;
format long;

% (b) - obtain b = F and A = -spA
% m = 19
[b1, A1] = generate_2d_poisson_FD_matrix_and_RHS(19);
% m = 99
[b2, A2] = generate_2d_poisson_FD_matrix_and_RHS(99);

A1 = -A1;
A2 = -A2;

% (c) solve the equation with e = 10^-18
% initial guess for m = 19
x0_1 = randi([0 19^2], size(b1));
% initial guess for m = 99
x0_2 = randi([0 99^2], size(b2));

[x1, N1] = gradient(A1, x0_1, -b1, 10^-8);
[x2, N2] = gradient(A2, x0_2, -b2, 10^-8);

fprintf('[Gradient descent] Number of iterations for m=19: %d.\n', N1);
fprintf('[Gradient descent] Number of iterations for m=99: %d.\n', N2);

% (d)

% modified gradient function is in the file
% gradient_iter.m
N = max(N1, N2);

delta_n=1000;
n = 1:delta_n:N;

errors1 = zeros(length(n));
errors2 = zeros(length(n));

for i=1:length(n)
    [x1, errors1(i)] = gradient_iter(A1, x0_1, -b1, n(i));
    [x2, errors2(i)] = gradient_iter(A2, x0_2, -b2, n(i));
end

semilogy(n, errors1, '-');
hold on;
semilogy(n, errors2, '--');

legend('m=19', 'm=99');


%% Conjugate Gradient

clc;
clear all;
format long;

% (b) - obtain b = F and A = -spA
% m = 19
[b1, A1] = generate_2d_poisson_FD_matrix_and_RHS(19);
% m = 99
[b2, A2] = generate_2d_poisson_FD_matrix_and_RHS(99);

A1 = -A1;
A2 = -A2;

% (c) solve the equation with e = 10^-18
% initial guess for m = 19
x0_1 = randi([0 19^2], size(b1));
% initial guess for m = 99
x0_2 = randi([0 99^2], size(b2));

[x1, N1] = conjugate_gradient(A1, x0_1, -b1, 10^-8);
[x2, N2] = conjugate_gradient(A2, x0_2, -b2, 10^-8);

fprintf('[Conjugate gradient] Number of iterations for m=19: %d.\n', N1);
fprintf('[Conjugate gradient] Number of iterations for m=99: %d.\n', N2);

% (d)

% modified conjugate gradient function is in the file
% conjugate_gradient_iter.m
N = max(N1, N2);

delta_n=8;
n = 1:delta_n:N;

errors1 = zeros(length(n));
errors2 = zeros(length(n));

for i=1:length(n)
    [x1, errors1(i)] = conjugate_gradient_iter(A1, x0_1, -b1, n(i));
    [x2, errors2(i)] = conjugate_gradient_iter(A2, x0_2, -b2, n(i));
end

semilogy(n, errors1, '-');
hold on;
semilogy(n, errors2, '--');

legend('m=19', 'm=99');
