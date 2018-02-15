function [sum] = EVENS(a)
%EVENS Returns the sum of the first even a numbers

sum = 0;
for i=1:a
   sum = sum + 2 * i;
end

end

