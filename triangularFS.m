%% defines a triangular wave with period 1 sampled at 100 samples/second
% no modifications needed.
N = 100;
Tsamp = 1/N;
ts = (0:1:N-1)*Tsamp;
xtri = (2/pi)*asin(cos(2*pi*ts)); 

figure(1);
plot(ts,xtri,'Linewidth',2)

%% compute the discrete-time Fourier series coefficients
% uncomment and complete
% Compute the Discrete Fourier Transform (DFT)
close all; clc;
Xtri = fft(xtri)/N;


% plot the 
% -- magnitude 
% -- log magnitude
% -- phase 
% of the fourier series coefficients on separate axes 
% (insert code below)
% Frequency axis
ks = -floor(N/2):(N-1-floor(N/2));

% Plot magnitude
figure(1);
stem(ks, abs(fftshift(Xtri)))
% Plot log magnitude
figure(2)
stem(ks, log10(abs(fftshift(Xtri))))

% Plot phase
figure(3);
stem(ks, angle(fftshift(Xtri)))

