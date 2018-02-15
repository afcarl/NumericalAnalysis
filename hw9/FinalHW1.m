function poly = FinalHW1(f, grid)
    temp = 1;
    polySym = 0;
    [~, n] = size(grid);
    syms x
    for i = 1:n
        for j = 1:n
            if(i ~= j)
                temp = temp * (x - grid(j))/(grid(i) - grid(j));
            end
        end
        polySym = polySym + (temp * f(grid(i)));
        temp = 1;
    end

    poly = matlabFunction(polySym);
end