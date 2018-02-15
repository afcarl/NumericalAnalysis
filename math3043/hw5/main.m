%% Homework 5 - Tu Tran

clc;
clear all;

format long

% (1) Initializing matrix A and vector b
A = diag(-2 * ones(199,1), 0) + diag(ones(198, 1), 1) ...
    + diag(ones(198, 1), -1);
b = ones(199, 1) * .0001;
b(1) = b(1) - 1;
b(199) = b(199) - 1;

% (2) Solving the boundary value problem
% Doing some calculation on paper
% We obtained: u(x) = 1/2 * x^2 + 1/2

% (3)
% Code is in jacobi.m and gauss_seidel.m files

% Let's try with 5000 iterations
% and x0 = [1; 1; ... 1]
[x1, diff1] = jacobi(A, b, ones(199, 1), 5001);

[x2, diff2] = gauss_seidel(A, b, ones(199, 1), 5000);

diff1
diff2

% (4) Plotting on (1, 500, 50000)
N = 1:500:50000;
% randomized x0
x0 = zeros(199, 1);

% graph 1 is for jacobi
% graph 2 is for gauss-seidel
graph1 = zeros(size(N));
graph2 = zeros(size(N));

for i = 1:length(N)
    [x1, diff1] = jacobi(A, b, x0, N(i));
    graph1(i) = diff1;
    [x2, diff2] = gauss_seidel(A, b, x0, N(i));
    graph2(i) = diff2;
end

plot(N, graph1, 'o')
hold on;
plot(N, graph2, 'k')

legend('Jacobi', 'Gauss-Seidel')

% Apparently from the graph we see that
% Gauss-Seidel is performing better and
% converging faster than Jacobi

% Approximately, I think Gauss-Seidel is converging
% 2 times faster than Jacobi