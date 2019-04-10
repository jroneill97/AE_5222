clc; clear; options = optimset('Display','off');

a_2 = 30; % degrees
s_l = 1;  % unity ratio

a_m = @(a_1) atan(0.5*(tand(a_1) + tand(a_2))); % mean flow direction

f   = @(a_1) 2*(s_l)*cos(a_m(a_1))*(tand(a_1) - tand(a_2))...
              *(cosd(a_2)/cosd(a_1))^3 - 2.2;
fprintf("-----------------------\n");
fprintf("a_1 = %0.2f degrees\n", fsolve(f,0,options));
fprintf("-----------------------\n");
