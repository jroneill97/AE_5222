hw2_2017_main;
% funciton inputs: (x,y,psi)
% given: x_bar(n), (v_n^2), theta(n)

syms x y
N_p   = threat_basis_data.n_threat_parameters;
theta = threat_parameters_true;
x_bar = threat_basis_data.basis_parameters.mean(1,:);
y_bar = threat_basis_data.basis_parameters.mean(2,:);
v_n   = threat_basis_data.basis_parameters.var;
c_off = 3;
V     = 0.1;


c_n=@(n) theta(n)*(((1 / sqrt(2 * pi * (v_n^2))) * exp(...
		 (-1 / (2 * (v_n^2))) * ...
		 ((x - x_bar(n))^2 + ...
		 (y - y_bar(n))^2) )));




% c_n=@(n)       (theta(n)/sqrt(2*pi*(v_n^2))) * ...
%                 exp(-(1/(2*(v_n^2)))*(x-x_bar(n))^2 + (y-y_bar(n))^2);            
c = c_off;

for n = 1:N_p
c = c + c_n(n);
end

dc_dx_n = @(n) -((theta(n)*(x-x_bar(n)))/(sqrt(2*pi)*(v_n^3)) * ...
            exp(((x-x_bar(n))^2 + (y-y_bar(n))^2)/(-2*(v_n^2))));
        
dc_dy_n = @(n)  -((theta(n)*(y-y_bar(n)))/(sqrt(2*pi)*(v_n^3)) * ...
            exp(((x-x_bar(n))^2 + (y-y_bar(n))^2)/(-2*(v_n^2))));
        
dc_dx = 0;
dc_dy = 0;

for n = 1:N_p
dc_dx = dc_dx + dc_dx_n(n);
dc_dy = dc_dy + dc_dy_n(n);
end


syms psi

% p1_dot_sum_part=@(n)    ((theta(n)*(x-x_bar(n)))/(sqrt(2*pi)*(v_n^2)^1.5))*...
%                         exp((-1/(2*(v_n^2)))*((x-x_bar(n))^2 + (y-y_bar(n))^2));
%                     
% p2_dot_sum_part=@(n)    ((theta(n)*(y-y_bar(n))/(sqrt(2*pi*(v_n^2))*(v_n^2))))*...
%                         exp((-1/(2*(v_n^2)))*((x-x_bar(n))^2 + (y-y_bar(n))^2));
% 
% p1_dot = 0;
% p2_dot = 0;
% 
% for n = 1:N_p
%     p1_dot = p1_dot + p1_dot_sum_part(n);
%     p2_dot = p2_dot + p2_dot_sum_part(n);
% end


% p1 = -c/(V*cos(psi) + w_x + tan(psi)*(V*sin(psi) + w_y));
% P2 = (-tan(psi)*c)/(V*cos(psi) + w_x + tan(psi)*(V*sin(psi) + w_y));

psi_dot = V*((dc_dy*cos(psi) - dc_dx*sin(psi))/c);

psi_dot = matlabFunction(psi_dot);
c = matlabFunction(c);






