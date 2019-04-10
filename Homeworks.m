
%% Problem 1 Part b
clc; clear;

rho = 8.9e-4;
Cd0 = 0.02;
K = 0.08;
W = 430000;
S = 4000;

% V_star  = sqrt(W/(0.5*rho*S*sqrt(Cd0/(3*K))));
% Cl_star = sqrt(Cd0/(3*K));

%% Problem 1 Part c
LD_ratio = @(V) (2*W)/(rho*V^2*S*(Cd0+K*((2*W)/(rho*V^2*S))^2));
syms V
LD_diff  = diff(LD_ratio,V);
V_span = linspace(200,1500);
LD_ratio_out = zeros(1,length(V_span));

for k = 1:length(V_span)
    V_current = V_span(k);
    
    LD_ratio_out(k) = LD_ratio(V_current);
end
[max_LD,~] = max(LD_ratio_out);
plot(V_span,LD_ratio_out);
hold on;
scatter(695.087,max_LD);
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
J = jacobian(L,state_array);

for k = [1:length(J)]
    fprintf("dL_d" + string(state_array(k)) +...
            " = " + string(J(k)) + ";\n");
end

int_guess = [10;10;10;10;10;10;10;10;10];
state_out = fsolve(@derivatives_question_3,int_guess);

for k = [1:length(state_out)]
    fprintf(string(state_array(k)) +...
            " = " + string(state_out(k)) + "\n");
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

E = 30e6;
G = 12e6;
T_max = 13600;

h1 = @(x1, x3) (4.013*sqrt((E*G*x3^2 * x1^6)/36)/196)*...
               (1-(x3/28)*sqrt(E/(4*G)));
    M  = @(x4) P*(14 + 0.5*x4);
    R  = @(x2, x3, x4) 0.5*sqrt(x4^2 + (x2 + x3)^2);
    J  = @(x2, x3, x4) sqrt(2)*x2*x4*(((x4^2)/12) + ((x2 + x3)^2)/4);

h2 = @(x2, x3, x4) sqrt((P/(sqrt(2)*x2*x4))^2 +...
                        (P/(sqrt(2)*x2))*(M(x4)/J(x2,x3,x4)) + ...
                        ((M(x4)*R(x2,x3,x4))/J(x2,x3,x4))^2);
h3 = @(x1, x3) (84*P)/(x1*x3^2);
h4 = @(x1, x3) (10976*P)/(E*x1*x3^3);

g1 =  @(x1) x1 - 2;
g2 =  @(x2) (1/8) - x2;
g3 =  @(x2, x3) x2 - x1;
g4 =  @(x3) 0.1 - x3;
g5 =  @(x3) x3 - 10;
g6 =  @(x6) 6000 - x6;
g7 =  @(x4) 0.1 - x4;
g8 =  @(x4) x4 - 10;
g9 =  @(x5) x5 - T_max;
g10 = @(x7) x7 - E;
g11 = @(x8) x8 - 0.25;

syms x1 x2 x3 x4 x5 x6 x7 x8
syms p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15
syms s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11

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
fprintf("\n\n");
fprintf("Cost:\n%d meters\n", minimum_distance);




















