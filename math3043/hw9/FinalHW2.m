function [ trapezoid, simpson, comp_trape, comp_simpson ] = FinalHW2( a, b, n, f )
%FINALHW2 Summary of this function goes here
%   Detailed explanation goes here
    h = (b - a) / n;
    
    comp_trape = 0;
    for i=1:n-1
        comp_trape = comp_trape + 2*f(a + i*h);
    end
    
    comp_simpson = 0;
    for i=1:n/2
        comp_simpson = comp_simpson + 4*f(a + (2*i-1)*h);
    end
    
    for i=1:(n/2)-1
        comp_simpson = comp_simpson + 2*f(a + (2*i)*h);
    end
    
    comp_trape = h/2 * (f(a) + comp_trape + f(b));
    comp_simpson = h/3 * (f(a) + comp_simpson + f(b));
    trapezoid = (b - a)/2 * (f(a) + f(b));
    simpson = (b - a)/2 * (f(a) + 4*f((a + b)/2) + f(b));
end

