%THL_302_PROJECT1_C
%PRINITIS POLYDOROS 2018030098
%LEONTIS PANAGIOTIS 2018030099
%MANTELOS VASILEIOS 2018030128
close all;
clear all;
%Part A;
%Samples and Period of Sampling
N=1024;
Fs=128;
Ts=1/Fs;
%Sampling Signal
dt=0:Ts:1;
x=10*cos(2*pi*20.*dt)-4*sin(2*pi*40.*dt+5);
%Fourier transform signal and plot
F=[-Fs/2:Fs/N:Fs/2-Fs/N];
xF=fftshift(fft(x,N)./(length(x)));

figure()
plot(F,abs(xF));
title(['Spectrum with Fs= ', num2str(Fs) ,' Hz']);
xlabel('F');
ylabel('|X(F)|')

%Part B
%Frequency of sampling and phase of sin
N=1024;
Fs=8*10^(3);
Ts=1/Fs;
dt=0:Ts:1;
phase=80;
F=[-Fs/2:Fs/N:Fs/2-Fs/N];
%Create discrete time signal and fourier transform and plot in frequency
%Repeat for each F0
%Set i equal to 1 as a flagship for subplot
i=1;
figure()
for F0= [100:125:475]
    subplot(4,1,i)
    x=sin(2*pi*F0.*dt+phase);
    xF=fftshift(fft(x,N)./length(x));
    plot(F,abs(xF));
    title(['Spectrum with Fo= ' ,num2str(F0),' Hz']);
    xlabel('F');
    ylabel('|X(F)|');
    %Increase i for next diagram
    i=i+1;
end
%Create discrete time signal and fourier transform and plot in frequency
%Repeat for each F0
%Set i equal to 1 as a flagship for subplot
i=1;
figure()
for F0=[7525:125:7900]
   subplot(4,1,i)
    x=sin(2*pi*F0.*dt+phase);
    xF=fftshift(fft(x,N)./length(x));
    plot(F,abs(xF));
    title(['Spectrum with Fo= ' ,num2str(F0),' Hz']);
    xlabel('F');
    ylabel('|X(F)|');
    i=i+1;
end
