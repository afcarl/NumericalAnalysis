%% Question 2

clear all;
clc;

format long;

for i=1:7
   N = 10 ^ i;
   fprintf('Difference for N=%i\n', N);
   % difference for (a)
   disp('(a)');
   diff_a = sum_small(N, 1) - sum_large(N, 1);
   single(diff_a)
   double(diff_a)
   
   % difference for (b)
   disp('(b)');
   diff_a = sum_small(N, 2) - sum_large(N, 2);
   single(diff_a)
   double(diff_a)

   % difference for (c)
   disp('(c)');
   diff_a = sum_small(N, 3) - sum_large(N, 3);
   single(diff_a)
   double(diff_a)
   
   % difference for (d)
   disp('(d)');
   diff_a = fun_d_small(N) - fun_d_large(N);
   single(diff_a)
   double(diff_a)
end

%% Question 3

clear all;
clc;

format long;

warning('off')

% tan(pi/4) = 1 so 4 * arctan(1) = pi
% sin(pi/2) = 1 so 2 * arctan(1) = pi
% Difference between arctan and pi
a_tan = double(4 * arctan_(1000, 1))
a_sin = double(6 * arcsine_(500, 1 / 2))


% We can see arcsine_ gives better results
double(a_tan - pi)
double(a_sin - pi)

y1 = zeros(1, 200);
y2 = zeros(1, 200);

for i=1:200
    y1(i) = 4 * arctan_(i, 1);
    y2(i) = 6 * arcsine_(i, 1/2);
end

x=1:200;
plot(x, y1, 'o')
hold on;

plot(x, y2, 'k')

plot(x, ones(1, 200) * pi, '-')
legend('4 * arctan(1)', '6 * arcsin(1/2)', 'pi')
axis([1 200 3 3.5])