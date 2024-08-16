function [h, nh] = echoIR(D,alpha)
% h[n] = d[n] + alpha*d[n-D]
[d1, nd1] = dtimpulse(0,0,0);
[d2, nd2] = dtimpulse(D, 0, D);
d2 = alpha * d2;
[h,nh] = sumsys(d1,nd1,d2,nd2);
end