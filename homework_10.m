clc; clear all;


fun = @homework_10_linear_equations;
guess = 1*ones(1,28);
fsolve(fun, guess)'

