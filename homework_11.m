% Author: Jack O'Neill
%   Date:   04/08/2019
%
clc; clf; clear variables;
hw2_2017_main;
%% To-do
% - check gradients
% - check psi_dot





%% Calculate wind-related gradients from cost matrix
cost = reshape(threat_value_true,[N_G N_G])';
[g1, g2] = gradient(-cost); % Calculate the wind gradient
[dw_x_dx,dw_x_dy] = gradient(g1); % Calculate derivatives of 
[dw_y_dx,dw_y_dy] = gradient(g2); % Wind gradient
    
%% Calculate optimal trajectories given a series of initial heading angles
num_psi_0       = 25;       % Number of initial heading angles between 0 and 2pi
n_iterations    = 6;        % Number of iterations (more results in a more precise final answer)
t0              = 0;        % Initial Time
tf              = 5;       % Final Time (not necessary to adjust)
pos_0           = [-1 -1];  % Initial x, y coordinates
psi_0_span      = linspace(pi/6,pi/3,100);
psi_repeat_list = psi_0_span;
check_radius    = 0.1;
nip             = 2;        % Number of integration points

for N = 1:n_iterations
    fprintf("---------- Iteration %d of %d ----------\n", N, n_iterations);
    new_repeat_list = 0;
%     clf;
%     hold on;
%     contour(linspace(-1,1,N_G), linspace(-1,1,N_G),...
%             reshape(threat_value_true,[N_G N_G])',N_G); % Contour plot
%     quiver(linspace(-1,1,N_G), linspace(-1,1,N_G),g1,g2); % Wind gradient
% %     xlim([1 - 2*check_radius 1 + 2*check_radius]);
% %     ylim([1 - 2*check_radius 1 + 2*check_radius]);
%     xlim([-1 1]);
%     ylim([-1 1]);
%     grid on;
%     viscircles([1 1],check_radius);
    
    for current_psi_0 = psi_0_span
        t         = t0;       % initialize t
        step_size = check_radius/3;
        n_steps   = tf/step_size;
        tspan     = t0:step_size:tf;       % Total time span
        currentStates = [pos_0 current_psi_0]';            % State array used inside the loop

        for k = 1:n_steps
            t1 = step_size*(k-1);
            t2 = step_size*k;
            temp_tspan = t1:(t2-t1)/nip:t2; 
            [tNew,tempStates] = ode45(@(t,y) homework_11_ode...
                                       (y,cost,g1,g2,dw_x_dx,dw_x_dy,dw_y_dx,dw_y_dy,N_G),...
                                        temp_tspan,currentStates);
            t(k) = t2;
            currentStates = tempStates(nip+1,1:3)';
            states_out(k,:) = currentStates'; 
        end     
            
%         plot(states_out(:,1),states_out(:,2)); %,'-s'); % Plot calculated trajectory
%         pause(0.001);
        
        for j = 1:length(states_out) % Test whether the trajectory crosses check radius
            if (norm([states_out(j,1) states_out(j,2)] - [1 1]) < check_radius)...
            && (~ismember(current_psi_0,new_repeat_list))
                new_repeat_list = [new_repeat_list current_psi_0];
                break;
            end
        end
    end

    drawnow;
    
    psi_repeat_list = new_repeat_list(2:end);
    if ~isempty(psi_repeat_list)
        psi_0_span = linspace(min(psi_repeat_list), max(psi_repeat_list), num_psi_0);
    else
        error("step_size or num_psi_0 is too small");
    end
    
    if rad2deg(norm(gradient(psi_repeat_list'))) < 0.001
        save_list = psi_repeat_list;
        disp(rad2deg(norm(gradient(psi_repeat_list'))));
        disp(rad2deg(save_list'));
        return;
    end
    
    check_radius = check_radius / 1.5;
    
    fprintf("Magnitude of possible psi_0: %0.5f degrees\n\n",...
            rad2deg(norm(gradient(psi_repeat_list'))));
    pause(0.5);
end

