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

