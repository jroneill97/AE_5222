%% Part b
clc; clear;

rho = 8.9e-4;
Cd0 = 0.02;
K = 0.08;
W = 430000;
S = 4000;

Cl_star = sqrt(Cd0/(3*K));

%% Part c
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
