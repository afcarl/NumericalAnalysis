function [x, diff] = gauss_seidel(A, b, x0, num_iters) 
%This function performs Gauss-Seidel iteration input :A,b,epsilon,x0 output x:approx. solution
%epfunction [x] = gauss_seidel(A,b,epsilon,x0) silon: tolerance. %xo: the initial value of iteration

z = -1:.01:1;
uz = 1/2 * z.^2 + ones(1, 201) * 1/2;

x = x0;

D = diag(diag(A)); %diagonal matrix of A
E = -tril(A,-1); 
F = -triu(A,1);

M = D - E;
B = M \ F;
f = M \ b;

for i = 1:num_iters
    x = B * x + f;
end

diff = norm(transpose(uz) - [1;x;1]);

end