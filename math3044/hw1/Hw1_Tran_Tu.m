%% Tu Tran - Homework 1
clear all;
clc;

% Age
X = [3 6 5 5 3 4 9 8 9 7 6 5 8 6];
% Height
y = [55 68 64 66 62 65 74 75 73 69 73 68 73 71];

% Correlation coefficients
CorrelationCoefficients = zeros(3,1);

% plot the points on the graph
scatter(X, y, 'k');
xlabel('Age (months)');
ylabel('Height (centimeters)');
hold on

n = length(X);
y_avg = mean(y);
xaxis = 3:9;

% applying linear regression
a = (n*dot(X, y) - sum(X)*sum(y)) / (n*sum(X.^2) - sum(X)^2);
b = (sum(X)*dot(X, y) - sum(X.^2)*sum(y)) / (sum(X)^2 - n*sum(X.^2));

f = @(t) a*t + b;

E2 = sqrt(sum((f(X) - y).^2)/n);
plot(xaxis, f(xaxis), 'r');

% applying nonlinear exponential regression
y_exp = log(y);
a = (n*dot(X, y_exp) - sum(X)*sum(y_exp)) / (n*sum(X.^2) - sum(X)^2);
b = (sum(X)*dot(X, y_exp) - sum(X.^2)*sum(y_exp)) / (sum(X)^2 - n*sum(X.^2));
b = exp(b);

g = @(t) b*exp(a*t);

E2 = sqrt(sum((g(X) - y).^2)/n);
plot(xaxis, g(xaxis), 'b');

% applying nonlinear log regression
X_log = log(X);
a = (n*dot(X_log, y) - sum(X_log)*sum(y)) / (n*sum(X_log.^2) - sum(X_log)^2);
b = (sum(X_log)*dot(X_log, y) - sum(X_log.^2)*sum(y)) / (sum(X_log)^2 - n*sum(X_log.^2));

h = @(t) a*log(t) + b;

E2 = sqrt(sum((h(X) - y).^2)/n);
plot(xaxis, h(xaxis), 'g');

legend('data points', 'linear regression', 'nonlinear exponential regression', 'nonlinear log regression');

% calculate coeff
funcs = {f g h};
for i=1:3
    ya = funcs{i}(X);
    CorrelationCoefficients(i) = sqrt((sum((y-y_avg).^2)-sum((ya-y).^2))/sum((y-y_avg).^2));
end

fprintf('Correlation coefficients are:\n')
CorrelationCoefficients