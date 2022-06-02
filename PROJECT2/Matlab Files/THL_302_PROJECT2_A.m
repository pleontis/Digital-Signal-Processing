%%%%lab2.ask1
%%%1.b

G_1=tf([0.2 0], [2 -0.9],1);
G_2= tf([0 1], [1 0.2], 1);

H=G_1*G_2;
%numerator
num= [ 0 0.2 0];
%denominator
den= [ 1 -0.7 -0.18];
%zeros and poles
zeros=roots(num);
poles=roots(den);
%plot the poles and zeros
figure(1)
zplane(zeros,poles);
title('Poles ans Zeros');

%%%1.d
figure(2)
d=-pi:pi/128:pi;
h=freqz(num,den,d);
subplot(2,1,1);
plot(d,abs(h));
ylabel('Magnitude');
subplot(2,1,2);
plot(d,angle(h));
ylabel('Phase');
figure(3)
freqz(num,den)

%1.e
figure(4)
num1=[0 0.2 0 0];
den1=[1 -1.7 0.52 0.18];
zeros1=roots(num1);
poles1=roots(den1);
H1=tf([0 0.2 0 0],[1 -1.7 0.52 0.18],1);
freqz(num1, den1,d)
