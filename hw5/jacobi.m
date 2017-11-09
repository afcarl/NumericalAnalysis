function [x, diff] = jacobi(A, b, x0, num_iters) 
%jaboci iteration

z = -1:.01:1;
uz = 1/2 * z.^2 + ones(1, 201) * 1/2;

x = x0;

D = diag(diag(A)); %diagonal matrix of A
E = -tril(A, -1); 
F = -triu(A, 1);

N = E + F;
B = D \ N;
f = D \ b;
for i = 1:num_iters
    x = B * x + f;
end

diff = norm(transpose(uz) - [1;x;1]);

end
