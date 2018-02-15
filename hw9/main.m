%% Matlab Homework 9 - Tu Tran
clc;
clear all;
format long;

% Part I
% (a)
f = @(x) sin(2*pi*x);
grida = linspace(-1, 1, 22);
interpoly = FinalHW1(f, grida);

[~, n] = size(grida);
y = zeros(1, n);
y2 = zeros(1, n);

for i=1:n
    y(i)=f(grida(i));
end

for i=1:n
    y2(i)=interpoly(grida(i));
end

figure;
grid on
plot(grida, y, '-r');
hold on;
plot(grida, y2, '--b');
legend('f', 'interpolation');
title('Plot with Equidistant Grid');
ylabel('y');
xlabel('x');

pert=zeros(1,n);
for i=1:n
    pert(i)=(0.001)*(-1)^i;
end
g=grida+pert;
for i=1:n
    y2(i)=interpoly(g(i));
end

figure;
grid on
plot(g, y2, ':b');
title('Interpolating Polynomial with Equidistant Perturbation');
ylabel('Function Value');
xlabel('Perturbation');

% (b)
gridb = linspace(-1, 1, 22);
for i=1:n
    gridb(i)=cos((2*i-1)*pi/(2*n));
end

interpoly2 = FinalHW1(f,gridb);

for i=1:n
    y(i)=f(gridb(i));
end

for i=1:n
    y2(i)=interpoly2(gridb(i));
end

figure;
grid on
plot(grida, y, '-r');
hold on;
plot(grida, y2, '--b');
legend('f', 'interpolation');
ylabel('y');
xlabel('x');
hold on
title('Plot with Chebyshev Grid');

pert=zeros(1,n);
for i=1:n
    pert(i)=(0.001)*(-1)^i;
end
g=gridb+pert;
for i=1:n
    y2(i)=interpoly(g(i));
end

figure;
grid on
plot(g, y2, ':b');
title('Interpolating Polynomial with Chebyshev Perturbation');
ylabel('Function Value');
xlabel('Perturbation');

% Part II
f = @(x) x^2 * exp(-x);
F = @(x) -(x^2 + 2*x + 2)*exp(-x)
a = 0;
b = 10;

% absolute value
target = F(b) - F(a)

n=1:50;
errors1 = zeros(1, length(n));
errors2 = zeros(1, length(n));
errors3 = zeros(1, length(n));
errors4 = zeros(1, length(n));

for k=1:length(n)
    N = k*2;
    [est1, est2, est3, est4] = FinalHW2(a, b, N, f);
    errors1(k) = abs(target - est1);
    errors2(k) = abs(target - est2);
    errors3(k) = abs(target - est3);
    errors4(k) = abs(target - est4);
end

figure()
plot(n, errors1, n, errors2, n, errors3, n, errors4);
xlabel('n');
ylabel('error');
legend('Trapezoid', 'Simpson', 'Composite Trapezoid', 'Composite Simpson');