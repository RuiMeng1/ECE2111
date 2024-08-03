%% 1
clc;clear all;close all
sqrt(-1); % 0.0000 + 1.0000i
i + j; % 0.0000 + 2.0000i
1i + 1j; % 0.0000 + 2.0000i

z1 = 1 + 1j;
fprintf("abs(z1) = %.4d\n", abs(z1));
fprintf("angle(z1) = %.4d\n", angle(z1)); % radians
fprintf("real(z1) = %.4d\n", real(z1));
fprintf("imag(z1) = %.4d\n", imag(z1));

z2 = 2*exp(1j*pi/3);

fprintf("abs(z1 + z2) = %.4d\n", abs(z1 + z2));

z3 = 7*exp(1j*pi/5);

scatter(real(z3), imag(z3), 'filled');
title("Plot of z3");
legend("z3");

scatter(real(1+sqrt(-1)),imag(1+sqrt(-1))); % 1 + 1j

%% 2
clc;clear all;close all

[x1, nx] = dtimpulse(1,-1,4);
[x2, nx] = dtimpulse(2,-1,4);
stem(nx,x1-x2); % graph A
title('Graph of x vs time');
xlabel('n (time in samples)');
ylabel('x[n]');

% 2.3a
[u0, nx] = dtstep(0,-5,5);
x0n = exp(0.3.*nx).*u0;

% b
[in2, nx] = dtimpulse(-2,-5,5);
[i4, nx] = dtimpulse(4,-5,5);
x1n = in2 - i4;

% c
% 0≤𝑛≤20
% 𝑥2[𝑛]=𝑛(𝑢[𝑛]−𝑢[𝑛−10])+10𝑒(−0.3(𝑛−10))(𝑢[𝑛−10]−𝑢[𝑛−20])

[u0, nx] = dtstep(0,0,20);
[u10, nx] = dtstep(10,0,20);
[u20, nx] = dtstep(20,0,20);

x2n = nx.*(u0 - u10) + 10*exp(-0.3.*(nx-10)).*(u10 - u20);
plot(nx, x2n)
title("x2[n]")



%% 3
clc; clear all; close all;
ty = -2:0.01:2;
y = (ty).^2;

t = linspace(-10, 10, 201);






%% functions
function [x, n] = dtstep(n0, n1, n2)
% dtstep: returns the unit step function x[n] = u[n - n0]
%         over range n1:n2
    n = n1:n2;
    x = zeros(1, length(n));
    x(n>=n0) = 1;
end
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


