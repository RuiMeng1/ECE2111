%% 4.1
clc; close all;
load('echart.mat');

echartnoisy = echart + 0.8*rand(size(echart));
imshow(echartnoisy);
title("Noisy Image 1");
imshow(echartnoisy, []);
title("Noisy Image 2");

%% 4.1.9
clc; close all;
x = ones(256,256);
hcol = [1,2,1];
hrow = [1,2,1];
Z = conv2(hcol,hrow,x);

%% 5.1
clc; close all;
h = [-1 1];
Yrow = conv2(1, h, echart);
Ycol = conv2(h,1,echart);
Yboth = conv2(h,h,echart);
Zrow = conv2(1,h,echartnoisy);

o = 1;
n1 = -3*o:1:3*o;
h1 = 1/sqrt(2*pi*o) *exp(-n1.^2/(2*o^2));

o = 2;
n2 = -3*o:1:3*o;
h2 = 1/sqrt(2*pi*o) *exp(-n2.^2/(2*o^2));

o = 3;
n3 = -3*o:1:3*o;
h3 = 1/sqrt(2*pi*o) *exp(-n3.^2/(2*o^2));

subplot(3,1,1)
stem(n1,h1);
title("h1");
subplot(3,1,2)
stem(n2,h2);
title("h2");
subplot(3,1,3);
stem(n3,h3);
title("h3");

%% 
close all;clc;
Zblur1 = conv2(h1,h1, echartnoisy);
Zblur2 = conv2(h2,h2, echartnoisy);
Zblur3 = conv2(h3,h3, echartnoisy);

Z1row = conv2(1,h,Zblur1);
Z2row = conv2(1,h,Zblur2);
Z3row = conv2(1,h,Zblur3);
