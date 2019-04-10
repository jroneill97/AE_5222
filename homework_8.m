clc; clear; close all;
hw2_2017_main;

N = 10;
theta = threat_parameters_true(1:N);
x1_bar = threat_basis_data.basis_parameters.mean(1,1:N)';
x2_bar = threat_basis_data.basis_parameters.mean(1,1:N)';

x_i = [-1; -1];
x_f = [ 1;  1];
v_n = zeros(1,N);
%b syms x1 x2 
x1 = @(k) 2*k + 1;
x2 = @(k) 2*k + 1;

f_1 = x1_2 - V*cos(u(k)) - x1_1;

syms x1 x2
syms p1 p2 p3 p4 p5 p6 p7 p8 p9 p10


dc_dx1 = theta1 * ((-sqrt(v_n1) * (x1_1 - x1_bar(1)))/sqrt(2*pi)) * exp((-1/v_n_1)*((x1_1 - x1_bar(1))^2 + (x2_1 - x2_bar_1)^2)) + ...
         theta2 * ((-sqrt(v_n2) * (x1_2 - x1_bar(2)))/sqrt(2*pi)) * exp((-1/v_n_2)*((x1_2 - x1_bar(2))^2 + (x2_2 - x2_bar_2)^2)) + ...
         theta3 * ((-sqrt(v_n3) * (x1_3 - x1_bar(3)))/sqrt(2*pi)) * exp((-1/v_n_3)*((x1_3 - x1_bar(3))^2 + (x2_3 - x2_bar_3)^2)) + ...
         theta4 * ((-sqrt(v_n4) * (x1_4 - x1_bar(4)))/sqrt(2*pi)) * exp((-1/v_n_4)*((x1_4 - x1_bar(4))^2 + (x2_4 - x2_bar_4)^2)) + ...
         theta5 * ((-sqrt(v_n5) * (x1_5 - x1_bar(5)))/sqrt(2*pi)) * exp((-1/v_n_5)*((x1_5 - x1_bar(5))^2 + (x2_5 - x2_bar_5)^2)) + ...
         theta6 * ((-sqrt(v_n6) * (x1_6 - x1_bar(6)))/sqrt(2*pi)) * exp((-1/v_n_6)*((x1_6 - x1_bar(6))^2 + (x2_6 - x2_bar_6)^2)) + ...
         theta7 * ((-sqrt(v_n7) * (x1_7 - x1_bar(7)))/sqrt(2*pi)) * exp((-1/v_n_7)*((x1_7 - x1_bar(7))^2 + (x2_7 - x2_bar_7)^2)) + ...
         theta8 * ((-sqrt(v_n8) * (x1_8 - x1_bar(8)))/sqrt(2*pi)) * exp((-1/v_n_8)*((x1_8 - x1_bar(8))^2 + (x2_8 - x2_bar_8)^2)) + ...
         theta9 * ((-sqrt(v_n9) * (x1_9 - x1_bar(9)))/sqrt(2*pi)) * exp((-1/v_n_9)*((x1_9 - x1_bar(9))^2 + (x2_9 - x2_bar_9)^2)) + ...
         theta10* ((-sqrt(v_n10)* (x1_10- x1_bar(10))/sqrt(2*pi)) * exp((-1/v_n_10)*((x1_10-x1_bar(10))^2+ (x2_10- x2_bar(10))^2)));
     
for k = [1:length(J)]
    fprintf("dL_d" + string(state_array(k)) +...
            " = " + string(J(k)) + ";\n");
end