% script to record audio in MATLAB
% Author: Scott Tyo, 2023, 
% Modified: James Saunderson, 29/7/2024

fs = 16000;
recobj = audiorecorder(fs,16,1,-1);
disp('5....')
pause(1)
disp('4....')
pause(1)
disp('3....')
pause(1)
disp('2....')
pause(1)
disp('1....')
pause(1)
disp('Go!!!')
recordblocking(recobj,2)
% y is the recorded audio data
y = getaudiodata(recobj);
% t is the vector of time-stamps
t = 0:(1/fs):((length(y)-1)/fs);
plot(t,y,'LineWidth',2)
title('Plot of recorded audio signal')
xlabel('time (seconds)')
