clc; clear; close all;
E     = 30e6;
G     = 12e6;

cost = @(l,h,t,b) 2.21*l*h^2 + 0.048*(b*t*(14+l));
buckling_load = @(b,t) (4.013*sqrt((E*G*b^2*t^6)/36)/196)*...
                       (1-(t/28)*sqrt(E/(4*G)));
M  = @(l,b,t)   6000*(14 + 0.5*l);
R  = @(l,h,t)   0.5*sqrt(l^2 + (h + t)^2);
J  = @(l,h,t)   sqrt(2)*h*l*(((l^2)/12) + ((h + t)^2)/4);    
shear_stress = @(l,h,t,b) sqrt((6000/(sqrt(2)*h*l))^2 + ...
                        (6000/sqrt(2)*h)*(M(l,b,t)/J(l,h,t)) + ...
                        ((M(l,b,t)*R(l,h,t))/J(l,h,t))^2);                
bending_stress = @(l,h,t,b) 84*6000/(b*t^2);
end_deflection = @(l,h,t,b) (10976*6000)/(E*b*t^3);

% Inequality Constraints

h1  = @(l,h,t,b,s1 ) b-2     + s1^2;
h2  = @(l,h,t,b,s2 ) 0.125-h + s2^2;
h3  = @(l,h,t,b,s3 ) h-2     + s3^2;
h4  = @(l,h,t,b,s4 ) h-b     + s4^2;
h5  = @(l,h,t,b,s5 ) 0.1-t   + s5^2;
h6  = @(l,h,t,b,s6 ) t-10    + s6^2;
h7  = @(l,h,t,b,s7 ) 0.1-l   + s7^2;
h8  = @(l,h,t,b,s8 ) l-10    + s8^2;
h9  = @(l,h,t,b,s9 ) 6000-buckling_load(b,t)       + s9^2;
h10 = @(l,h,t,b,s10) shear_stress(l,h,t,b)-13600   + s10^2;
h11 = @(l,h,t,b,s11) bending_stress(l,h,t,b)-30000 + s11^2;
h12 = @(l,h,t,b,s12) end_deflection(l,h,t,b)-0.25  + s12^2;

L    = @(l,h,t,b,...
         p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,...
         s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12)...
      cost(l,h,t,b)...
    + p1  * h1 (l,h,t,b,s1 ) ... 
    + p2  * h2 (l,h,t,b,s2 ) ...
    + p3  * h3 (l,h,t,b,s3 ) ...
    + p4  * h4 (l,h,t,b,s4 ) ...
    + p5  * h5 (l,h,t,b,s5 ) ...
    + p6  * h6 (l,h,t,b,s6 ) ...
    + p7  * h7 (l,h,t,b,s7 ) ...
    + p8  * h8 (l,h,t,b,s8 ) ...
    + p9  * h9 (l,h,t,b,s9 ) ...
    + p10 * h10(l,h,t,b,s10)...
    + p11 * h11(l,h,t,b,s11)...
    + p12 * h12(l,h,t,b,s12);


syms l h t b
syms p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12
syms s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12

state_array = [l h t b...
               p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12...
               s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12];
           
J = gradient(L,state_array);

for k = 1:length(J)
    fprintf("dL_d" + string(state_array(k)) +...
            " = " + string(J(k)) + ";\n");
end

int_guess = ones(1,28);
int_guess(1:4) = [5 1 5 1.2];


state_out = fsolve(@derivatives_question_5,int_guess);

fprintf("\nl = %0.2f inches\n",state_out(1));
fprintf("h = %0.2f inches\n"  ,state_out(2));
fprintf("t = %0.2f inches\n"  ,state_out(3));
fprintf("b = %0.2f inches\n"  ,state_out(4));
fprintf("cost = $%0.2f\n",cost(state_out(1),state_out(2),...
                               state_out(3),state_out(4)));
                           
                           
l	= state_out(1);
h	= state_out(2);
t	= state_out(3);
b	= state_out(4);

fprintf("\nbuckling load = %0.2f psi\n",buckling_load(b,t));
fprintf("shear stress = %0.2f psi\n",shear_stress(l,h,t,b));
fprintf("bending stress = %0.2f psi\n",bending_stress(l,h,t,b));
fprintf("end deflection = %0.2f inches\n",end_deflection(l,h,t,b));







