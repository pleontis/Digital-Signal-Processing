%THL_302_PROJECT2_B
%PRINITIS POLYDOROS 2018030098
%LEONTIS PANAGIOTIS 2018030099
%MANTELOS VASILEIOS 2018030128


%B.1
num=[4 -3.5 0]; %Numerator of H
den=[1 -2.5 1];  %Denominator of H

%Use tf fynction for creating H(z)
H=tf(num,den,-1)

[R, P, K]=residuez(num,den)
A=R(1)
B=R(2)

%Create symbolic variable z
syms  z
x=A/(1-P(1)*z^(-1))+B/(1-P(2)*z^(-1));
%Print results
pretty(x)

%B.2
%Print inverse Z transform and compare to theoretical results
 iztrans(x)
