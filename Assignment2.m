%% 2
clc;clear all; close all;
n = 0:3;
dn = [1,0,0,0];
un = ones(4);

[yout, nout] = sumsys(dn,n,un,n); % testing sumsys

%% 4
clc; clear all; close all;
n = 0:3;
dn = [1,0,0,0];
[yout, nout] = delaysys(dn,n, 4);

%% 5
clc;clear all;close all;
[x1,nx1] = dtimpulse(1,-1,4);
[x2,nx2] = dtimpulse(2,-1,4);
[z,nz] = sumsys(x1,nx1,x2,nx2);
[y,ny] = delaysys(1,z,nz);
stem(ny,y);
title("Graph of y vs time")
%% 6 TESTING
clc; clear all; close all;
load AUDUSD;

[average, nout] = threepointaverage(aud,taud);

subplot(2,1,1);
plot(taud,aud, 'r');
title("AUD/USD");
ylim([0.68,0.8])
subplot(2,1,2);
plot(nout, average, 'g');
title("3 Point Average AUD/USD");
ylim([0.68,0.8])

%% 7 Testing
clc;clear all; close all;
L = 100;
K = -1;
[x, n] = dtstep(0,-2,L);
[y, ny] = feedbacksys(x,n,K);
plot(ny,y);

%% 7
function [y, nout] = feedbacksys(x, nin, K)

    % first two values of y are 0 since y[n - 2] and y[n - 1] don't exist
    y = zeros(1,length(x));
    nout = nin;
    for i = 1:length(nin)
        if i == 1 || i == 2
            y(i) = 0;
        else
            y(i) = x(nin == (nin(i) - 2)) + K*y(nin == (nin(i) - 2));
        end
    end
end
%% 6
function [y, nout] = threepointaverage(x, nin)
% y = 1/3 * x2[n] + 1/3 * x1[n] + 1/3 * x[n], x2 = Delay2[x], x1 = Delay1[x]
% creating x1 and x2 using delaysys
x1 = delaysys(1,x,nin);
x2 = delaysys(2,x,nin);

nout = nin;

u = x*1/3;
u1 = x1 * 1/3;
w = sumsys(u, nin, u1, nin);

u2 = x2 * 1/3;
y = sumsys(w,nin,u2,nin);
end


%% 3
function [y, ny] = delaysys(N, x, nx)
    ny = nx;
    y = [];
    for n = ny
        newY = 0;
        if any(nx == n - N)
            newY = x(nx == n - N);
        end
        y = [y, newY];
    end

end
%% 2
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

%% other functions
function [x, n] = dtimpulse(n0, n1, n2)
% dtimpulse: returns discrete-time unit impulse function
% centered at n0 over time range n1:n2
% [x, n] = dtimpulse(n0, n1, n2)
% where n0, n1, and n2 are integers with n1 <= n0 <= n2,
% produces signal x[n] = delta[n-n0] for n1 <= n <= n2.
n = n1:n2;
x = zeros(1,length(n));
x(n==n0) = 1;
end 
function [x, n] = dtstep(n0, n1, n2)
% dtstep: returns the unit step function x[n] = u[n - n0]
%         over range n1:n2
    n = n1:n2;
    x = zeros(1, length(n));
    x(n>=n0) = 1;
end

