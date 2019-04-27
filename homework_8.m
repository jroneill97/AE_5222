%%
% Notes
% * In derivatives_8 the partial derivatives with function handles @(n) are
%     only being called outside the for loop, making n = 25 and not 1:25
% * is v_n supposed to be v_n^2?
% 



clc; clear;
 clf;
hw2_2017_main;

x0 = ones(54,1);
states_out = fsolve(@derivatives_question_8,x0);

x = states_out(1:11);
y = states_out(12:22);
psi = states_out(45:54);

hold on;
contour3( linspace(-1,1,N_G), linspace(-1,1,N_G),reshape(threat_value_true,[N_G N_G])',N_G);
plot(x,y,'-r');

%%
% 
% $$e^{\pi i} + 1 = 0$$
% 

