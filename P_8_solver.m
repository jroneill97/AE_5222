clc; clear all; close all

fun=@P_8_fun;
x0=ones(50,1);
x=fsolve(fun,x0)