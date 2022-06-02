%THL_302_PROJECT3_B
%PRINITIS POLYDOROS 2018030098
%LEONTIS PANAGIOTIS 2018030099
%MANTELOS VASILEIOS 2018030128

clear all;
close all;
%Specifications
Ts=0.2;
Fs=1/Ts;
wc=2;
Fcut=wc/(2*pi);
Fnyquist=Fs/2;
Fcheby=Fcut/Fnyquist;

grade=[2 16];
%Create two Chebyshev highpass filters with order 2, 16
[num1,den1]=cheby1(grade(1),3,Fcheby,'high');
[H1,w1]=freqz(num1,den1,256);

[num2,den2]=cheby1(grade(2),3,Fcheby,'high');
[H2,w2]=freqz(num2,den2,256);
%Calculate amplitude of each frequency response
H1_cheby_db=20*log10(abs(H1));
H2_cheby_db=20*log10(abs(H2));
%Show amplitudes on same plot
figure()
plot(w1,H1_cheby_db,w1,H2_cheby_db);
axis([0 1 -200 5]);
title('Frequency response of each Chebyshev Filter');
xlabel('Equivalent frequency w (radians/sample)');
ylabel('Magnitude (dB)');
legend('2nd order','16th order');
