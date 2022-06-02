%THL_302_PROJECT1_A
%PRINITIS POLYDOROS 2018030098
%LEONTIS PANAGIOTIS 2018030099
%MANTELOS VASILEIOS 2018030128
close all;
clear all;
%Part A
%Create a duration for each signal
xTime=-15:15;
yTime=-15:15;

%Create two random signals
X=xTime.^(2).*(xTime<=0)+xTime.^(3).*(xTime>0);
Y=2.^(abs(yTime));
figure()
subplot(2,1,1)
stem(xTime,X);
title('x[n]');
xlabel('n');
subplot(2,1,2)
stem(yTime,Y);
title('y[n]');
xlabel('n');
%Duration of Convolution
hTime=xTime(1)+yTime(1):xTime(end)+yTime(end);
%Length of each signal
LenH=length(hTime);
LenX = length(X); 
LenY = length(Y);
% Zero-padding
X0 = [zeros(1, LenY-1) X zeros(1, LenY-1)]; 
%Create y[-n]
Y_reversed=Y(end:-1:1);

x0Time=xTime(1)-(LenY-1):xTime(end)+(LenY-1);

for i=1:LenH % Length of Convolution
Y_reversed0 = [zeros(1,(i-1)) Y_reversed zeros(1,(LenH-i))];
H1(i) = sum(X0.*Y_reversed0); %Output signal 
end 

figure()
subplot(2,1,1); 
stem(hTime,H1);
title('Convolution theoretically calculated');
xlabel('n');
subplot(2,1,2);
H2=conv(X,Y);
stem(hTime,H2);
title('Convolution calculated with Matlab function conv()');
xlabel('n');

%Part B
%Samples are equal to Convolution's Length
N=LenH;
%Fourier Transform each signal and then multiply
xF=fftshift(fft(X,N));
yF=fftshift(fft(Y,N));
temp2=xF.*yF;
temp2=ifft(temp2,N);
%Show results
figure()
stem(hTime,abs(temp2));
title('Inverse FFT of [F(x) x F(y)]');
xlabel('n');