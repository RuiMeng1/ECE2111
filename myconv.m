function [y, ny] = myconv(x,nx,h,nh)
% Performs a convolution on signals x and h
% Inputs:
%   x   : input signal x
%   nx  : time vector for x
%   h   : filter signal 
%   nh  : time vector for filter signal
% Outputs:
%   y   : convolution signal of x*h(t)
%   ny  : time vector for y
ny = (nx(1) + nh(1)):(nx(length(nx)) + nh(length(nh)));
y = conv(x,h);
end
