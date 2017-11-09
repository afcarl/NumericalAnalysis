%% Problem 1
clear all;
clc;

% the sum of the first 4 numbers is
disp('the sum of the first 4 even numbers')
EVENS(4)

disp('the sum of the first 100 even numbers')
EVENS(100)

%% Problem 2
clear all;
clc;

% one real root
disp('one real root')
[x1, x2] = ROOTS(1, 2, 1)

% two different real roots
disp('two different real roots')
[x1, x2] = ROOTS(1, 5, 4)

% no real roots
disp('no real roots')
[x1, x2] = ROOTS(1, 1, 1)


%% Problem 3
clear all;
clc;

disp('two vectors u and v')
u = [2 3 4 5];
v = [10 20 30 40];

[module_u, module_v, scalar, angle] = VECTORS(u, v)