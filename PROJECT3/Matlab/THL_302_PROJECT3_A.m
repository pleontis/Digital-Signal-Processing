%THL_302_PROJECT3_A
%PRINITIS POLYDOROS 2018030098
%LEONTIS PANAGIOTIS 2018030099
%MANTELOS VASILEIOS 2018030128

clear all;
close all;
%Specifications
Fs=10*10^3;
wp=2*pi*3000;
ws=2*pi*4000;
ripple_p=3;
ripple_s=30;
%Find butterwoth filter's order
[N,Wn]=buttord(wp,ws,ripple_p,ripple_s,'s');
%Convert Fcutoff from analog to digital
Fcut=Wn/(2*pi);
Fnyquist=Fs/2;
Fbutter=Fcut/Fnyquist;
[B,A]=butter(N,Fbutter);
freqz(B,A)
title('Low Pass Butterworth Filter')