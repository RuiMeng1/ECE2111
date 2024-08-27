function [y, ty, xout, hout] = myctconv(x,xstart,h,hstart,Ts)
    % Function to compute continuous-time convolution
    y = conv(x,h)*Ts;
    ty = (0:(length(y)-1))*Ts;
    ty = ty + xstart + hstart;
    
    xout = zeros(size(y));
    hout = zeros(size(y));
    
    % find the index in y where x starts (be careful comparing floats)
    xfirst = find((ty > xstart-Ts/2),1);
    % insert the input vector x into the right time-slots in the output version of x
    xout((0:(length(x)-1)) + xfirst) = x;

    hfirst = find((ty > hstart-Ts/2),1);
    hout((0:(length(h)-1)) + hfirst) = h;
end