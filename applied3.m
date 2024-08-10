%% 4
clc;clear all;close all;

n = -2:10;
xn = double(n >= 0) - double(n >= 7);
stem(n,xn);
title("Plot of x")

hn = 0.5.^(n).* (double(n>= 0) - double(n>=4));
stem(n,hn);
title("Plot of h")

%% 4c
clc;clear all;close all;
n = -2:10;
xn = double(n == 0) + double(n==1) + double(n==2);
hn = 0.5.^(n).* (double(n>= 0) - double(n>=4));
yn = conv(hn,xn);
stem(-4:20, yn);
title("Plot of x*h conv")
%% test
clc; close all; clear all;