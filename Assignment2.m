%% main
% Example inputs
x1 = [1, 2, 3];
nin1 = [0, 1, 2];
x2 = [4, 5];
nin2 = [1, 2];

% Call the function
[y, nout] = sumsys(x1, nin1, x2, nin2);

% Display the results
disp('Output y:');
disp(y);
disp('Output nout:');
disp(nout);



%% 1
function [y, nout] = sumsys(x1, nin1, x2, nin2)
    % Initialize nout
    nout = [];
    
    % nin2 is below nin1
    if nin2(end) < nin1(end) && nin2(1) < nin1(1)
        i = 1;
        while i <= length(nin2) && nin2(i) < nin1(1)
            nout = [nout, nin2(i)];
            i = i + 1;
        end
        nout = [nout, nin1];
    end
    
    % nin2 is above nin1
    if nin2(end) > nin1(end) && nin2(1) > nin1(1)
        i = 1;
        while i <= length(nin1) && nin1(i) < nin2(1)
            nout = [nout, nin1(i)];
            i = i + 1;
        end
        nout = [nout, nin2];
    end
    
    % nin2 has nin1 as a subset of itself
    if nin2(end) >= nin1(end) && nin2(1) <= nin1(1)
        nout = nin2;
    end
    
    % nin1 has nin2 as a subset of itself
    if nin2(end) <= nin1(end) && nin2(1) >= nin1(1)
        nout = nin1;
    end
    
    % calculate y
    y = [];
    for n = nout
        newY = 0;
        if any(nin1 == n)
            newY = newY + x1(nin1 == n);
        end
        if any(nin2 == n)
            newY = newY + x2(nin2 == n);
        end
        y = [y, newY];
    end
end
