%THL_302_PROJECT1_B
%PRINITIS POLYDOROS 2018030098
%LEONTIS PANAGIOTIS 2018030099
%MANTELOS VASILEIOS 2018030128
close all;
clear all;

DT=0.001;
tmin=0;
tmax=0.5;
time=tmin:DT:tmax;
%Creating and ploting the signal x(t)
x=5*cos(24*pi.*time)-2*sin((3/2)*pi.*time);
figure(1)
plot(time,x);
title('x(t)');
%Sampling with Ts=1/48, 1/24,1/12
%Create new time for sampling and create the new signal
%Plot the previous signal with blue and the sampled with red
for Ts=[1/48 1/24 1/12]
td=tmin:Ts:tmax;
xA=5*cos(24.*pi.*td)-2.*sin((3/2)*pi.*td);
figure()
plot(time,x);
hold on;
plot(td,xA,'*');
hold off;
title(['Sampling with Ts= ',num2str(Ts),' s']);
end
%Group number is 80. Sampling with Ts=1/80;
figure()
Ts=1/80;
td=tmin:Ts:tmax;
plot(time,x);
xA=5*cos(24*pi.*td)-2*sin((3/2)*pi.*td);
hold on;
plot(td,xA,'*');
hold off;
title('Sampling with Ts=1/80 s');