% Author: Jack O'Neill
%   Date:   04/08/2019
%
clf; clear variables;
hw2_2017_main;
%% To-do
% - check gradients
% - check psi_dot





%% Calculate wind-related gradients from cost matrix
cost = reshape(threat_value_true,[N_G N_G])';
[g1, g2] = gradient(-cost); % Calculate the wind gradient
[dw_x_dx,dw_x_dy] = gradient(g1); % Calculate derivatives of 
[dw_y_dx,dw_y_dy] = gradient(g2); % Wind gradient

%% Plot the contour and wind gradient
hold on;
contour(linspace(-1,1,N_G), linspace(-1,1,N_G),...
        reshape(threat_value_true,[N_G N_G])',N_G); % Contour plot
quiver(linspace(-1,1,N_G), linspace(-1,1,N_G),g1,g2); % Wind gradient
xlim([-1 1]);
ylim([-1 1]);
grid on;
    
%% Calculate optimal trajectories given a series of initial heading angles
num_psi_0  = 500; % Number of initial heading angles between 0 and 2pi
tspan      = [0 500]; % Time span
pos_0      = [-1 -1];  % Initial x, y coordinates
psi_0      = linspace(pi/5.5,pi/4,num_psi_0);

for i = 1:length(psi_0)
    states_int = [pos_0 psi_0(i)]; % Initial states [x_0, y_0, psi_0];
    [t,states] = ode45(@(t,y)...
                  homework_11_ode...
                  (y,cost,g1,g2,dw_x_dx,dw_x_dy,dw_y_dx,dw_y_dy,N_G),...
                  tspan,states_int);
    
    plot(states(:,1),states(:,2)); % Plot calculated trajectory

    pause(0.001);
end





