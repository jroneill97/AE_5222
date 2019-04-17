hw2_2017_main;
% funciton inputs: (x,y,psi)
% given: x_bar(n), v_n, theta(n)

syms x y
N_p   = threat_basis_data.n_threat_parameters;
theta = threat_parameters_true;
x_bar = threat_basis_data.basis_parameters.mean(1,:);
y_bar = threat_basis_data.basis_parameters.mean(2,:);
v_n   = threat_basis_data.basis_parameters.var;
c_off = 3;
V     = 0.1;

c_n=@(n)       (theta(n)/sqrt(2*pi*v_n)) * ...
                exp(-(1/(2*v_n))*(x-x_bar(n))^2 + (y-y_bar(n))^2);

w_x_n=@(n)      ((-1*theta(n)*(x-x_bar(n)))/(sqrt(2*pi)*v_n^1.5))* ...
                exp(((x-x_bar(n))^2+(y-y_bar(n))^2)/(-2*v_n));

w_y_n=@(n)      ((-1*theta(n)*(y-y_bar(n))/(sqrt(2*pi)*v_n^1.5)))* ...
                exp(((x-x_bar(n))^2+(y-y_bar(n))^2)/(-2*v_n));

dwx_dx_n=@(n)   -1*(((theta(n)*((x-x_bar(n))^2))/(-sqrt(2*pi)*v_n^2.5))+...
                (theta(n)/(sqrt(2*pi)*v_n^1.5)))*...
                exp(((x-x_bar(n))^2+(y-y_bar(n))^2)/(-2*v_n));

dwx_dy_n=@(n)   ((-1*theta(n)*(x-x_bar(n))*(y-y_bar(n)))/(-1*sqrt(2*pi)*v_n^2.5))*...
                exp(((x-x_bar(n))^2+(y-y_bar(n))^2)/(-2*v_n));

dwy_dx_n=@(n)   ((-1*theta(n)*(x-x_bar(n))*(y-y_bar(n)))/(-1*sqrt(2*pi)*v_n^2.5))*...
                exp(((x-x_bar(n))^2+(y-y_bar(n))^2)/(-2*v_n));

dwy_dy_n=@(n)   -1*(((theta(n)*((y-y_bar(n))^2))/(-sqrt(2*pi)*v_n^2.5))+...
                (theta(n)/(sqrt(2*pi)*v_n^1.5)))*...
                exp(((x-x_bar(n))^2+(y-y_bar(n))^2)/(-2*v_n));
            
c = c_off;
w_x = 0;
w_y = 0;
dwx_dx = 0;
dwx_dy = 0;
dwy_dx = 0;
dwy_dy = 0;

for n = 1:N_p
c = c + c_n(n);
w_x = w_x + w_x_n(n);
w_y = w_y + w_y_n(n);
dwx_dx = dwx_dx + dwx_dx_n(n);
dwx_dy = dwx_dy + dwx_dy_n(n);
dwy_dx = dwy_dx + dwy_dx_n(n);
dwy_dy = dwy_dy + dwy_dy_n(n);
end

syms psi
p1=         -c/(V*cos(psi) + w_x + tan(psi)*(V*sin(psi) + w_y));
p2=         -(tan(psi)*c)/(V*cos(psi) + w_x + tan(psi)*(V*sin(psi) + w_y));


p1_dot_sum_part=@(n)    ((theta(n)*(x-x_bar(n)))/(sqrt(2*pi)*v_n^1.5))*...
                        exp((-1/(2*v_n))*((x-x_bar(n))^2 + (y-y_bar(n))^2));
                    
p2_dot_sum_part=@(n)    ((theta(n)*(y-y_bar(n))/(sqrt(2*pi*v_n)*v_n)))*...
                        exp((-1/(2*v_n))*((x-x_bar(n))^2 + (y-y_bar(n))^2));

p1_dot = -(p1*dwx_dx + p2*dwy_dx);
p2_dot = -(p1*dwx_dy + p2*dwy_dy);

for n = 1:N_p
    p1_dot = p1_dot + p1_dot_sum_part(n);
    p2_dot = p2_dot + p2_dot_sum_part(n);
end


% p1 = -c/(V*cos(psi) + w_x + tan(psi)*(V*sin(psi) + w_y));
% P2 = (-tan(psi)*c)/(V*cos(psi) + w_x + tan(psi)*(V*sin(psi) + w_y));

psi_dot = ((p2_dot*p1 - p1_dot*p2)*cos(psi)^2)/p1^2;

psi_dot = matlabFunction(psi_dot);
c = matlabFunction(c);
w_x = matlabFunction(w_x);
w_y = matlabFunction(w_y);
dwx_dx = matlabFunction(dwx_dx);
dwx_dy = matlabFunction(dwx_dy);
dwy_dx = matlabFunction(dwy_dx);
dwy_dy = matlabFunction(dwy_dy);




