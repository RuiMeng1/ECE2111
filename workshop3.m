% skeleton script for ECE2111 workshop 4

% sampling rate
Fs = 8192;

% echo system has difference equation
% y[n] = x[n] + (1/5)*x[n-Fs] + ...
%              (1/10)*x[n-2*F2] + ...
%              (1/15)*x[n-3*F2] + ...
%              (1/20)*x[n-4*F2]

%% task 1: define vectors necho and hecho that represent the impulse
% response of the echo system
maxechoes = 4;
% insert your code below to define necho and hecho


%% (no change needed here)
% defines a signal xscale that plays the C major scale
% holding each note for 0.5 seconds (no modifications needed)
% frequencies of the scale
freqs = 440*2.^[-9/12,-7/12,-5/12,-4/12,-2/12,0,2/12,3/12];
duration = 0.5; % seconds per note

% time vector of the scale
tscale = (0:1:(duration*length(freqs)*Fs-1))/Fs;
% initialise the signal values
xscale = zeros(1,length(tscale));
% build the scale
for k=1:length(freqs)
    xscale = xscale + cos(2*pi*freqs(k)*tscale).*((tscale>=(k-1)*duration) - (tscale>=k*duration));
end

%% task 2: pass the C scale signal through the echo system by using convolution
% play the resulting sound.

% uncomment and complete
% yecho = 


% pause() ensures subsequent calls to soundsc  
% don't play on top of each other
% uncomment next two lines to play the echo
% soundsc(yecho,Fs)
% pause();

%% upsample the C scale signal to L=5 times the sampling rate
L = 5;
xscaleup = zeros(1,L*length(xscale));
% insert values of xscale in every Lth entry of xscaleup
xscaleup(1:L:end) = xscale;

% plot the first 101 samples
stem((0:100), xscaleup(1:101))
title('First 101 samples of C scale after upsampling and interpolation by h0')
xlabel('n (samples)')

% uncomment next two lines when you are up to here
% soundsc(xscaleup,L*Fs)
% pause();

%% task 4a:
% define the first interpolation filter impulse response
% uncomment and complete
% h0 = ;

% pass xscaleup through that interpolation fiter
% uncomment and complete
% y0 = 

% plot the first 101 samples of y0
% add your code below (use a stem plot)


% play the resulting sound
% add your code below. 


% uncomment to pause after playing sound
% pause()

%% task 4b:
% define the second interpolation filter impulse response
% uncomment and complete
% h1 = ;

% pass xscaleup through that interpolation fiter
% uncomment and complete
% y1 = 

% plot the first 101 samples of y1
% add your code below (use a stem plot)


% play the resulting sound
% add your code below. 


% uncomment to pause after playing sound.
% pause()