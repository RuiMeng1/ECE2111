%% Simple Echo
clc; close all
t = 0:0.05:2; % time
w = -2*pi:0.05:2*pi; % frequency domain

% impulse response
h = (t == 0) + 0.8.*(t == 1.8);% h = d(t) + 0.8d(t-1.8)

% Fourier transfrom function
H = 1 + 0.8.* exp(-1j.*w*1.8);

%plot
figure(1)
plot(w/(2*pi), abs(H));
title("Absolute value of H(w)")

figure(2)
plot(w/(2*pi), angle(H));
title("Angle of H(w)")

% this corresponds to graph 2 for question 1

%% Convolution of input with impulse response

input = cos(t*2*pi*3/5);
convolve = conv(input, h);
t_conv = linspace(0,4, length(convolve));

figure(1)
plot(t_conv, convolve)

%% Frequency response output
a = 0.8; t0 = 1.8;
w0 = 3*pi/5;
H2 = 1+a*exp(w0*1j*t0);
output = abs(H2).*cos(t*2*pi*3/5 + angle(H2));
