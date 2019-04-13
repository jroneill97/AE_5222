clc; clear; close all;
hw2_2017_main;
% funciton inputs: (x,y,psi)
% given: x_bar(n), v_n, theta(n)

syms x y
N_p   = threat_basis_data.n_threat_parameters;
theta = threat_parameters_true;
x_bar = threat_basis_data.basis_parameters.mean(1,:);
y_bar = threat_basis_data.basis_parameters.mean(2,:);
v_n   = threat_basis_data.basis_parameters.var;
c_off = 3;
V     = 0.1;

f = @(n) (theta(n)*(x-x_bar(n))/(sqrt(2*pi*v_n)*v_n)) * ...
exp(-(1/(2*v_n))*(x-x_bar(n))^2 + (y-y_bar(n))^2);

w_x_n=@(n) (-1*theta(n)*(x-x_bar(n))/(sqrt(2*pi)*v_n^1.5))* ...
    exp(((x-x_bar(n))^2+(y-y_bar(n))^2)/-2*v_n);

w_y_n=@(n) (-1*theta(n)*(y-y_bar(n))/(sqrt(2*pi)*v_n^1.5))* ...
    exp(((x-x_bar(n))^2+(y-y_bar(n))^2)/-2*v_n);

dwx_dx_n=@(n) (-1*(theta(n)*(x-x_bar(n)^2)/(1*sqrt(2*pi)*v_n^2.5)+...
    theta(n)/(sqrt(2*pi)*v_n^1.5))*...
    exp(((x-x_bar(n))^2+(y-y_bar(n))^2)/(-2*v_n)));

dwx_dy_n=@(n) ((-1*theta(n)*(x-x_bar(n))*(y-y_bar(n)))/(-1*sqrt(2*pi)*v_n^2.5))*...
    exp(((x-x_bar(n))^2+(y-y_bar(n))^2)/(-2*v_n));

dwy_dx_n=@(n) ((-1*theta(n)*(x-x_bar(n))*(y-y_bar(n)))/(-1*sqrt(2*pi)*v_n^2.5))*...
    exp(((x-x_bar(n))^2+(y-y_bar(n))^2)/(-2*v_n));

dwy_dy_n=@(n) (-1*(theta(n)*(y-y_bar(n)^2)/(1*sqrt(2*pi)*v_n^2.5)+...
    theta(n)/(sqrt(2*pi)*v_n^1.5))*...
    exp(((x-x_bar(n))^2+(y-y_bar(n))^2)/(-2*v_n)));

c = c_off;
w_x = 0;
w_y = 0;
dwx_dx = 0;
dwx_dy = 0;
dwy_dx = 0;
dwy_dy = 0;

for n = 1:N_p
c = c + f(n);
w_x = w_x + w_x_n(n);
w_y = w_y + w_y_n(n);
dwx_dx = dwx_dx + dwx_dx_n(n);
dwx_dy = dwx_dy + dwx_dy_n(n);
dwy_dx = dwy_dx + dwy_dx_n(n);
dwy_dy = dwy_dy + dwy_dy_n(n);
end





p_1 = -c/(V*cos(psi) + w_x + tan(psi)*(V*sin(psi) + w_y));
P_2 = (-tan(psi)*c)/(V*cos(psi) + w_x + tan(psi)*(V*sin(psi) + w_y))