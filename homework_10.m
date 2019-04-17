clc; clear all;


fun = @homework_10_linear_equations;
guess = ones(1,29);
fsolve(fun, guess);

