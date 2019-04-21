
%% Problem 1 

% Part b
clc; clear;

rho = 8.9e-4;
Cd0 = 0.02;
K = 0.08;
W = 430000;
S = 4000;

Cl_star = sqrt(Cd0/(3*K));

% Part c

LD_ratio = @(V) (2*W)/(rho*V^2*S*(Cd0+K*((2*W)/(rho*V^2*S))^2));
syms V 
V_star  = ((8*W^2)/(25*S^2*rho^2*Cd0))^0.25;
V_span = linspace(200,1500);
LD_ratio_out = zeros(1,length(V_span));

for k = 1:length(V_span)
    V_current = V_span(k);
    
    LD_ratio_out(k) = LD_ratio(V_current);
end

[max_LD,~] = max(LD_ratio_out);
plot(V_span,LD_ratio_out);
hold on;
scatter(V_star,max_LD);
xlabel("V ($$\frac{ft}{s}$$)","interpreter","latex");
ylabel("$$\frac{L}{D}$$","interpreter","latex");
title("$$\frac{L}{D}$$ vs. Velocity","interpreter","latex");
grid on;

%% Problem 3
clc; clear; clear L; close all;

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
J = gradient(L,state_array);

for k = [1:length(J)]
    fprintf("dL_d" + string(state_array(k)) +...
            " = " + string(J(k)) + ";\n");
end

int_guess = [10;10;10;10;10;10;10;10;10];
state_out = fsolve(@derivatives_question_3,int_guess);

for k = [1:length(state_out)]
    fprintf(string(state_array(k)) +...
            "* = " + string(round(state_out(k),3)) + "\n");
end

%% Problem 4
clc; clear; close all;
P    = 20;
f    = @(x1,x2) 2*sqrt(2)*x1 + x2;
g1   = @(x1,x2) P*(x2+sqrt(2)*x1)/(sqrt(2)*x1^2 + 2*x1*x2) - 20;
g2   = @(x1,x2) P/(x1 + sqrt(2)*x2) - 20;
g3   = @(x1,x2) P*x2/(sqrt(2)*x1^2 + 2*x1*x2) - 15;
g4   = @(A1)    A1 - 5;
g5   = @(A2)    A2 - 5;
g6   = @(A3)    A3 - 5;
g7   = @(A1)    A1 - 0.1;
g8   = @(A2)    A2 - 0.1;
g9   = @(A3)    A3 - 0.1;


L    = @(x1,x2,A1,A2,A3,p1,p2,p3,p4,p5,p6,p7,p8,p9,s1,s2,s3,s4,s5,s6,s7,s8,s9)...
      f(x1,x2)...
    + p1*(g1(x1,x2) + s1^2)...
    + p2*(g2(x1,x2) + s2^2)...
    + p3*(g3(x1,x2) + s3^2)...
    + p4*(g4(A1)    + s4^2)...
    + p5*(g5(A2)    + s5^2)...
    + p6*(g6(A3)    + s6^2)...
    + p7*(g7(A1)    + s7^2)...
    + p8*(g8(A2)    + s8^2)...
    + p9*(g9(A3)    + s9^2);
    


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
state_out = fsolve(@derivatives_question_4,int_guess);

for k = [1:length(state_out)]
    fprintf(string(state_array(k)) +...
            " = " + string(state_out(k)) + "\n");
end

%% Problem 5
clc; clear; close all;
P = 6000;
E = 30e6;
G = 12e6;
T_max = 13600;
f = @(x2,x4) 2.21*x4 *x2^2;


h1 = @(x1, x3) (4.013*sqrt((E*G*x3^2 * x1^6)/36)/196)*...
               (1-(x3/28)*sqrt(E/(4*G)));
    M  = @(x4) P*(14 + 0.5*x4);
    R  = @(x2, x3, x4) 0.5*sqrt(x4^2 + (x2 + x3)^2);
    J  = @(x2, x3, x4) sqrt(2)*x2*x4*(((x4^2)/12) + ((x2 + x3)^2)/4);
h2 = @(x2, x3, x4) sqrt((P/(sqrt(2)*x2*x4))^2 + (P/(sqrt(2)*x2))*(M(x4)/J(x2,x3,x4)) + ((M(x4)*R(x2,x3,x4))/J(x2,x3,x4))^2);
h3 = @(x1, x3) (84*P)/(x1*x3^2);
h4 = @(x1, x3) (10976*P)/(E*x1*x3^3);

h5  =  @(x1,s1)     2 - x1 + s1^2;
h6  =  @(x2,s2)     (1/8) - x2 + s2^2;
h7  =  @(x1,x2,s3)  x1 - x2 + s3^2;
h8  =  @(x3,s4)     0.1 - x3 + s4^2;
h9  =  @(x3,s5)     x3 - 10 + s5^2;
h10 =  @(x6,s6)     6000 - x6 + s6^2;
h11 =  @(x4,s7)     0.1 - x4 + s7^2;
h12 =  @(x4,s8)     x4 - 10 + s8^2;
h13 =  @(x5,s9)     x5 - T_max + s9^2;
h14 =  @(x7,s10)    x7 - E + s10^2;
h15 =  @(x8,s11)    x8 - 0.25 + s11^2;
h16 =  @(x2,s12)    x2 - 2 + s12^2;

L    = @(x1,x2,x3,x4,x5,x6,x7,x8,...
         p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,...
         s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12)...
      f(x2,x4)...
    + p1*(h1(x1,x3))...
    + p2*(h2(x2,x3,x4))...
    + p3*(h3(x1,x3))...
    + p4*(h4(x1,x3))...
    + p5*(h5(x1,s1))...
    + p6*(h6(x2,s2))...
    + p7*(h7(x1,x2,s3))...
    + p8*(h8(x3,s4))...
    + p9*(h9(x3,s5))...
    + p10*(h10(x6,s6))...
    + p11*(h11(x4,s7))...
    + p12*(h12(x4,s8))...
    + p13*(h13(x5,s9))...
    + p14*(h14(x7,s10))...
    + p15*(h15(x8,s11))...
    + p16*(h16(x2,s12));    



syms x1 x2 x3 x4 x5 x6 x7 x8
syms p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16
syms s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12

state_array = [x1 x2 x3 x4 x5 x6 x7 x8...
               p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16...
               s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12];
           
J = gradient(L,state_array);

for k = [1:length(J)]
    fprintf("dL_d" + string(state_array(k)) +...
            " = " + string(J(k)) + ";\n");
end
options=optimset('MaxFunEvals',100000);
options=optimset(options,'MaxIter',100000);
options=optimset(options, 'disp','iter','LargeScale','off','TolFun',.001);
int_guess = ones(1,36);
int_guess(3) = 5;
int_guess(1) = 1;
int_guess(2) = 0.1;
state_out = fsolve(@derivatives_question_8,int_guess,options);

% for k = [1:length(state_out)]
%     fprintf(string(state_array(k)) +...
%             " = " + string(state_out(k)) + "\n");
% end

fprintf("\nl = %0.2f inches\n",state_out(4));
fprintf("b = %0.2f inches\n",state_out(1));
fprintf("t = %0.2f inches\n",state_out(3));
fprintf("h = %0.2f inches\n",state_out(2));
fprintf("cost = $%0.2f\n",f(state_out(2),state_out(4)));
%% Problem 8

        
    





















%% Problem 9
clc; clear; close all;

dist_mat = [[0   51  217 169 454];
            [51  0   182 163 449];
            [217 182 0   151 373];
            [169 163 151 0   289];
            [454 449 373 289 0  ]];
possible_paths = perms([1 2 3 4 5]);
city_names = ["Boston", "Providence", "New York", "Albany", "Buffalo"];
% (from, to)
possible_paths = [possible_paths zeros(length(possible_paths),1)];
path_length = zeros(1,length(possible_paths));
for k = 1:length(possible_paths)
    possible_paths(k,end) = possible_paths(k,1);
    for j = 1:length(possible_paths(k,:)) - 1
        from_city_idx = possible_paths(k,j);
        to_city_idx   = possible_paths(k,j+1);
        path_length(k) = path_length(k) + dist_mat(from_city_idx,to_city_idx);
    end
end
path_length = path_length(2:end);
minimum_distance = min(path_length);
[~, min_idx] = min(abs(path_length));
minimum_path = possible_paths(min_idx,:);

fprintf("Optimal path:\n");
fprintf("%d ", minimum_path);
fprintf("\n");
for i = 1:length(minimum_path)
    fprintf(city_names(minimum_path(i)) + ", ");
end
fprintf("\n");
fprintf("\n\n");
fprintf("Cost:\n%d miles\n", minimum_distance);





















