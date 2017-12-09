%% Matlab Homework 8 - Tu Tran

clc;
clear all;

warning('off');

% (a)
F = @(x1, x2)[
    exp(x1^2 + x2^2) - 1;
    exp(x1^2 - x2^2) - 1]

JF = @(x1, x2)[
    2*x1*exp(x1^2 + x2^2) 2*x2*exp(x1^2 + x2^2);
    2*x1*exp(x1^2 - x2^2) -2*x2*exp(x1^2 - x2^2)];

x0 = [.1; .1];
% target solution
[x, i] = newton(F, JF, x0, 1e-5, 100)

n=1:20;

errors1 = zeros(length(n));
errors2 = zeros(length(n));
errors3 = zeros(length(n));

for i=1:length(n)
    x1 = newton(F, JF, [.1; .1], 1e-6, i);
    x2 = newton(F, JF, [10; 10], 1e-6, i);
    x3 = newton(F, JF, [20; 20], 1e-6, i);
    
    errors1(i) = max(norm(F(x1(1), x1(2))) - norm(F(x(1), x(2))));
    errors2(i) = max(norm(F(x2(1), x2(2))) - norm(F(x(1), x(2))));
    errors3(i) = max(norm(F(x3(1), x3(2))) - norm(F(x(1), x(2))));
end

figure();
semilogy(n, errors1, n, errors2, n, errors3);
xlabel('Iterations');
ylabel('Relative Error');
legend('x0 = (0.1, 0.1)', 'x0 = (10, 10)', 'x0 = (20, 20)');

% x0 = (0.1, 0.1) converges the fastest
% x0 = (10, 10) converges more slowly
% x0 = (20, 20) does not converge at all

% (b)
F = @(x1, x2, x3)[
    x1^3 - 10*x1 + x2 - x3 + 3;
    x2^3 + 10*x2 - 2*x1 - 2*x3 - 5;
    x1 + x2 - 10*x3 + 2*sin(x3) + 5]

JF = @(x1, x2, x3)[
    3*x1^2 - 10, 1, -1;
    -2, 3*x2^2 + 10, -2;
    1, 1, -10 + 2*cos(x3)];

x0 = [0; 0; 0];
% target solution
[x, i] = newton2(F, JF, x0, 1e-5, 100)

n=1:5;

errors1 = zeros(length(n));
errors2 = zeros(length(n));

for i=1:length(n)
    x1 = newton2(F, JF, [1; 1; 1], 1e-6, i);
    x2 = newton2(F, JF, [0; 0; 0], 1e-6, i);
    
    errors1(i) = max(norm(F(x1(1), x1(2), x1(3))) - norm(F(x(1), x(2), x(3))));
    errors2(i) = max(norm(F(x2(1), x2(2), x2(3))) - norm(F(x(1), x(2), x(3))));
end

figure();
semilogy(n, errors1, n, errors2);
xlabel('Iterations');
ylabel('Relative Error');
legend('x0 = (1, 1, 1)', 'x0 = (0, 0, 0)');