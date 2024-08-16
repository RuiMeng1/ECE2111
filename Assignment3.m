%% 1 
clc; close all

[x,nx] = dtimpulse(0,0,0);
h = [1:1:3, 3:-1:1];
nh = -2:3;
[y,ny] = myconv(h,nh, x,nx);

[h,nh] = dtimpulse(0,0,0);
x = 0:3;nx = 1:4;
[y,ny] = myconv(x,nx,h,nh);

%% 2
clc;close all;
D = 6144;
alpha = 0.5;
Fs = 8192;

[h, nh] = echoIR(D,alpha);

ny = 0:(length(y)-1);

[yecho, nout] = myconv(y,ny, h, nh);
[yecho2, nou] = myconv(yecho,nout,h,nh);
soundsc(yecho2,Fs)

%% 3
clc;close all;
[trumpet, trumpetFs] = audioread('trumpet.wav');
[hSports, Fs] = audioread('sportscentre.wav');
trumpetSports = conv(hSports,trumpet);
%soundsc(trumpetSports, Fs);

[cave, caveFs] = audioread("cavemono.wav");
trumpetCave = conv(trumpet,cave);
soundsc(trumpetCave,Fs)