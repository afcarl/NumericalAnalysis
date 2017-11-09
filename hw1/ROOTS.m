function [x1, x2] = ROOTS(a, b, c)
%% Problem 2
% Determine if a second order equation has two, one or zero real
% roots

delta = b^2 - 4*a*c;
x1 = (-b + sqrt(delta)) / (2 * a);
x2 = (-b - sqrt(delta)) / (2 * a);

end
