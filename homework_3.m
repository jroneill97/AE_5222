clc; clear; clear L; close all; options = optimset('Display','off');

f    = @(x1,x2,x3) x1^3 - 6*x1^2 + 11*x1 + x3;
g1   = @(x1,x2,x3) x1^2 + x2^2 - x3^2;
g2   = @(x1,x2,x3) 2 - sqrt(x1^2 + x2^2 + x3^2);
g3   = @(x1,x2,x3) x3 - 5;

L    = @(x1,x2,x3,p1,p2,p3,s1,s2,s3)...
    f(x1,x2,x3)...
    + p1*(g1(x1,x2,x3) + s1^2)...
    + p2*(g2(x1,x2,x3) + s2^2)...
    + p3*(g3(x1,x2,x3) + s3^2);


syms x1 x2 x3 p1 p2 p3 s1 s2 s3
state_array = [x1 x2 x3 p1 p2 p3 s1 s2 s3];
J = jacobian(L,state_array);

for k = [1:length(J)]
    fprintf("dL_d" + string(state_array(k)) +...
            " = " + string(J(k)) + ";\n");
end

int_guess = [10;10;10;10;10;10;10;10;10];
state_out = fsolve(@derivatives_question_3,int_guess,options);

fprintf("--------------------\n");
for k = [1:length(state_out)]
    fprintf(string(state_array(k)) +...
            "* = " + string(state_out(k)) + "\n");
end