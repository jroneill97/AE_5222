clc; clear; close all;

w = 6.286e3;

p1 = w*(cosd(90+22.5) + i*sind(90+22.5))
p2 = w*(cosd(90+45+22.5) + i*sind(90+45+22.5))
p3 = w*(cosd(90+45+22.5) - i*sind(90+45+22.5))
p4 = w*(cosd(90+22.5) - i*sind(90+22.5))

syms s
s = tf('s');

D = (s-p1)*(s-p2)*(s-p3)*(s-p4)