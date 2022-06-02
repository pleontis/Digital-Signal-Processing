%THL_302_PROJECT3_C
%PRINITIS POLYDOROS 2018030098
%LEONTIS PANAGIOTIS 2018030099
%MANTELOS VASILEIOS 2018030128

clear all;
close all;
%Specifications
Fs=100;

Wcut=0.5*pi/(pi*Fs);
%Create fir filter with hamming windows N=21,41
hp1=fir1(20,Wcut,hamming(21));
[H1,W1]=freqz(hp1,21);

hp2=fir1(40,Wcut,hamming(41));
[H2,W2]=freqz(hp2,41);

figure()
subplot(1,2,1)
plot(W1,abs(H1));
xlabel('\omega (rad/sec)');
ylabel('|H1(e^j^\omega)|');
title ('Hamming N=21');
subplot(1,2,2)
plot(W2,abs(H2));
xlabel('\omega (rad/sec)');
ylabel('|H1(e^j^\omega)|');
title ('Hamming N=41');

%Create fir filter with hanning windows N=21,41
hp3=fir1(20,Wcut,hanning(21));
[H3,W3]=freqz(hp3,21);

hp4=fir1(40,Wcut,hanning(41));
[H4,W4]=freqz(hp4,41);

figure()
subplot(1,2,1)
plot(W3,abs(H3))
xlabel('\omega (rad/sec)');
ylabel('|H1(e^j^\omega)|');
title ('Hanning N=21');
subplot(1,2,2)
plot(W4,abs(H4))
xlabel('\omega (rad/sec)');
ylabel('|H1(e^j^\omega)|');
title ('Hanning N=41');

%Sample signal  with Sampling Frequency Fs
Ts=1/Fs;
t=0:Ts:1;
xt=sin(15*t)+(1/4)*sin(200*t);
%Fouier Transform
X=fft(xt);
N1=length(X);
f1=-Fs/2:Fs/N1:Fs/2-Fs/N1;

%Create two filtered signals with hamming
y1=filter(H1,1,xt);
y2=filter(H2,1,xt);

%Create two filtered signals with hanning
y3=filter(H3,1,xt);
y4=filter(H3,1,xt);

%Fourier Transform
Y1=fft(y1);
Y2=fft(y2);

Y3=fft(y3);
Y4=fft(y4);

N_Y1=length(Y1);
f2=-Fs/2:Fs/N_Y1:Fs/2-Fs/N_Y1;

N_Y2=length(Y3);
f3=-Fs/2:Fs/N_Y2:Fs/2-Fs/N_Y2;
%Show unfiltered signals Spectrum
figure()
plot(f1,fftshift(abs(X)))
title('X(f)')
xlabel('F');
ylabel('|X(f)|');

%Filtered with hamming
figure()
subplot(1,2,1)
plot(f2,fftshift(abs(Y1)))
title('Filtering with Hamming N=21');
xlabel('F');
subplot(1,2,2)
plot(f2,fftshift(abs(Y2)))
title('Filtering with Hamming N=41');
xlabel('F');
%Filtered with hanning
figure()
subplot(1,2,1)
plot(f3,fftshift(abs(Y3)))
title('Filtering with Hanning N=21');
xlabel('F');
subplot(1,2,2)
plot(f3,fftshift(abs(Y4)))
title('Filtering with Hanning N=41');
xlabel('F');
