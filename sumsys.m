function [y, nout] = sumsys(x1, nin1, x2, nin2)
    nout = union(nin1, nin2);
    y = zeros(1, length(nout));
    for i = 1:length(nout)
        n = nout(i);
        if any(nin1 == n)
            y(i) = y(i) + x1(nin1 == n);
        end
        if any(nin2 == n)
            y(i) = y(i) + x2(nin2 == n);
        end
    end
end

