%THL_302_PROJECT3_C
%PRINITIS POLYDOROS 2018030098
%LEONTIS PANAGIOTIS 2018030099
%MANTELOS VASILEIOS 2018030128

clear all;
close all;

%Specifications
Fs=10*10^3;
Ts=1/Fs;
wp=2*pi*3000;
ws=2*pi*4000;
ripple_p=3;
ripple_s=30;
%Create low-pass filter
[N,Wn]=buttord(wp,ws,ripple_p,ripple_s,'s');
Fcut=Wn/(2*pi);
Fnyquist=Fs/2;
Fbutter=Fcut/Fnyquist;
[B,A]=butter(N,Fbutter);
%Create Frequency Axis
Ns=2048;
F=-Fs/2:Fs/Ns:Fs/2-Fs/Ns;
%Sampling
n=0:499;
x1=1+cos(1000*n*Ts)+cos(16000*n*Ts)+cos(30000*n*Ts);
%Filtering
X1=filter(B,A,x1);
%Compute Fourier Transforms for each signal
Fx1=fftshift(fft(x1,Ns))*Ts;
FX1=fftshift(fft(X1,Ns))*Ts;

figure()
subplot(2,1,1)
plot(n,x1);
title(['X(t) Sampled with Ts=' num2str(Ts)]);
xlabel('t');
subplot(2,1,2);
plot(n,X1);
title('X(t) After filtering with low-pass filter');
xlabel('t')

figure()
subplot(2,1,1)
plot(F,abs(Fx1).^2);
title('Spectrum');
xlabel('F');
ylabel('|X(F)|');
subplot(2,1,2)
plot(F,abs(FX1).^2);
title('Spectrum after low pass filtering');
xlabel('F');
ylabel('|X(F)|');
%% PART 2
%Specifications
Ts=0.2;
Fs=1/Ts;
wc=2;
Fcut=wc/(2*pi);
Fnyquist=Fs/2;
Fcheby=Fcut/Fnyquist;
%Create high-pass filters
[num2,den2]=cheby1(16,3,Fcheby,'high');
%Create Frequency Axis
F=-Fs/2:Fs/Ns:Fs/2-Fs/Ns;

%Sampling
n=0:499;
x2=1+cos(1.5*n*Ts)+cos(5*n*Ts);
%Filtering
X2=filter(num2,den2,x2);

%Compute Fourier Transforms for each signal
Fx2=fftshift(fft(x2,Ns))*Ts;
FX2=fftshift(fft(X2,Ns))*Ts;


figure()
subplot(2,1,1)
plot(n,x2);
title(['X(t) Sampled with Ts=' num2str(Ts)]);
xlabel('t');
subplot(2,1,2)
plot(n,X2);
title('X(t) After filtering with high-pass filter');
xlabel('t')

figure()
subplot(2,1,1)
plot(F,abs(Fx2).^2);
title('Spectrum');
xlabel('F');
ylabel('|X(F)|');
subplot(2,1,2)
plot(F,abs(FX2).^2)
title('Spectrum after high pass filtering');
xlabel('F');
ylabel('|X(F)|');
