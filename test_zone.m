clc; clear; clf;

t = linspace(0,1,10000000);

A = 1000;
Vhum   = sin(2*pi*60*t);
Vaudio = 0.1*sin(2*pi*600*t);

a = (A/(1+A))*Vaudio + Vhum;
b = A*Vaudio + Vhum;

 plot(t,a);
 hold on
 plot(t,b);
xlim([0 1/60])