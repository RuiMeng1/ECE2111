% *Welcome to workshop 5 for ECE2111!* 
% In this workshop we discuss the input-output behaviour of continuous time 
% LTI systems in the time-domain. 

%% Activity 2: continuous-time convolution in MATLAB
% Use the function |myctconv| to compute the convolution of the following 
% two signals:
% 
% $x(t) = u(t) - u(t-1)$ and $h(t) = \begin{cases} \cos(\pi t) & -0.5 \leq t 
% < 0.5\\0 & \text{otherwise}\end{cases}$
% * Try sampling rates of $F_s = 10,100,1000$ samples per second. 
% * In each case, plot the signals $x$and $h$ and their convolution $x \ast 
% h$ on the same set of axes.

% complete the code for activity 2 below
% Sampling rate
close all; clc;
Fs = 1000; % You can adjust this to 10 or 100 as required
Ts = 1/Fs;

% Define x(t) = u(t) - u(t-1)
xstart = -1;
tx = -1:Ts:1;  
x = double(tx >= 0) - double(tx >= 1); % u(t) - u(t-1)

% Define h(t) = cos(pi*t) for -0.5 <= t <= 0.5
hstart = -1;
th = -1:Ts:1;  
h = (th >= -0.5 & th <= 0.5) .* cos(pi*th);

% Call the myctconv function
[y, ty, xout, hout] = myctconv(x, xstart, h, hstart, Ts);

% Plot the signals and their convolution
figure;
hold on;
plot(ty, xout, 'b', 'DisplayName', 'x(t)');
plot(ty, hout, 'r', 'DisplayName', 'h(t)');
plot(ty, y, 'g', 'DisplayName', 'y(t)');
legend;
xlabel('Time (s)');
ylabel('Amplitude');
title(['Convolution of x(t) and h(t) at Fs = ', num2str(Fs), ' samples per second']);
grid on;
hold off;


%% *Activity 4: convolution of infinite duration signals in MATLAB*
% Use MATLAB to find the convolution of 
% 
% $x(t) = e^{-t}u(t)$ and $h(t) = u(t) - u(t-1)$.
%% 
% * Define a MATLAB vector |x4| and starting time |x4start| to represent the 
% signal $x$ for $0\leq t \leq 2$ at a sampling rate of $F_s = 100$ samples/second.

% uncomment and complete

Fs =100 ;
Ts = 1/Fs;
xstart = 0;
tx = xstart:Ts:2;
x = exp(-tx).*(tx == 1);
hstart = 0;
th = hstart:Ts:2;
h = ones(1,length(th)).* (th < 0 & th > 1);

% call myctconv to compute the convolution
[y, ty, xout, hout] = myctconv(x, xstart, h, hstart, Ts);
% plot the convolution, as well as x and h on the same set of axes
figure;
hold on;
plot(ty, xout, 'b', 'DisplayName', 'x(t)');
plot(ty, hout, 'r', 'DisplayName', 'h(t)');
plot(ty, y, 'g', 'DisplayName', 'y(t)');
legend;
xlabel('Time (s)');
ylabel('Amplitude');
title(['Convolution of x(t) and h(t) at Fs = ', num2str(Fs), ' samples per second']);
grid on;
hold off;