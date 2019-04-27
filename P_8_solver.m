clc; clear all; close all

fun=@derivatives_question_8;
x0=ones(54,1);
x=fsolve(fun,x0)