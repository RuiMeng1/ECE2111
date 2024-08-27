%% load the signal
load unknownSignal.mat

%% play the associated sound 
% (uncomment if you want to do this)
% soundsc(y,fs) % play the signal
% pause(N/fs) % pause for the duration of the signal

%% compute the discrete-time Fourier series coefficients
% uncomment and complete
% Y = ;

% plot the 
% -- magnitude 
% -- log magnitude
% -- phase 
% of the fourier series coefficients on separate axes 
% (insert code below)



%% complete this section after inspecting the plots
% note down the (smallest positive) value of k corresponding to the 
% largest magnitude Fourier series coefficient
% kmax = ;

% find the corresponding frequency in Hz
% fmax = ;

% construct a pure sinusoid of frequency fmax
% Hint: use t as the time vector
% (uncomment and complete)
% ycomparison = ;

% play the comparison signal to check if you
% have identified the original correctly
% uncomment and run
% soundsc(ycomparison,fs)