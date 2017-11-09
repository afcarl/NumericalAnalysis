function  d = forwardsolve( L,b )
%perform back substitution on an upper triangular square matrix U to solve
%Ux=b

n = length(b);
d=zeros(n,1);

for i=1:n
    sum = b(i);
    for j=1:(i-1)
        sum = sum - L(i, j)*d(j);
    end
    
    d(i) = sum / L(i,i);
end 

end

