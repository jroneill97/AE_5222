clc; clear; close all; options = optimset('Display','off');
P    = 20;
f    = @(x1,x2)    2*sqrt(2)*x1 + x2;
h1   = @(x1,x2,s1) P*(x2+sqrt(2)*x1)/(sqrt(2)*x1^2 + 2*x1*x2) - 20 + s1^2;
h2   = @(x1,x2,s2) P/(x1 + sqrt(2)*x2) - 20 + s2^2;
h3   = @(x1,x2,s3) P*x2/(sqrt(2)*x1^2 + 2*x1*x2) - 15 + s3^2;
h4   = @(A1,s4)    A1 - 5 + s4^2;
h5   = @(A2,s5)    A2 - 5 + s5^2;
h6   = @(A3,s6)    A3 - 5 + s6^2;
h7   = @(A1,s7)    A1 - 0.1 + s7^2;
h8   = @(A2,s8)    A2 - 0.1 + s8^2;
h9   = @(A3,s9)    A3 - 0.1 + s9^2;


L    = @(x1,x2,A1,A2,A3,p1,p2,p3,p4,p5,p6,p7,p8,p9,s1,s2,s3,s4,s5,s6,s7,s8,s9)...
    f(x1,x2)...
    + p1*(h1(x1,x2,s1))...
    + p2*(h2(x1,x2,s2))...
    + p3*(h3(x1,x2,s3))...
    + p4*(h4(A1,s4)   )...
    + p5*(h5(A2,s5)   )...
    + p6*(h6(A3,s6)   )...
    + p7*(h7(A1,s7)   )...
    + p8*(h8(A2,s8)   )...
    + p9*(h9(A3,s9)   );
    


syms x1 x2 A1 A2 A3
syms p1 p2 p3 p4 p5 p6 p7 p8 p9
syms s1 s2 s3 s4 s5 s6 s7 s8 s9

state_array = [x1 x2 A1 A2 A3...
               p1 p2 p3 p4 p5 p6 p7 p8 p9...
               s1 s2 s3 s4 s5 s6 s7 s8 s9];
           
J = jacobian(L,state_array);

for k = [1:length(J)]
    fprintf("dL_d" + string(state_array(k)) +...
            " = " + string(J(k)) + ";\n");
end

int_guess = [10;10;10;10;10;10;10;10;10;10;10;10;10;10;10;10;10;10;10;10;10;10;10];
state_out = fsolve(@derivatives_question_4,int_guess,options);
fprintf("--------------------\n");
for k = [1:length(state_out)]
    fprintf(string(state_array(k)) +...
            "* = " + string(round(state_out(k),3)) + "\n");
end