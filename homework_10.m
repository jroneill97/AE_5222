clc; clear all;


fun = @homework_10_linear_equations;
guess = 1*ones(1,29);
fsolve(fun, guess)'

