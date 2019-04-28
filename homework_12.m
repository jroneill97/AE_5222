% Author: Jack O'Neill
%   Date:   04/08/2019
%
clc; clf; clear variables;
hw2_2017_main;
generate_functions;



%% Calculate optimal trajectories given a series of initial heading angles
num_psi_0       = 100;       % Number of initial heading angles between 0 and 2pi
n_iterations    = 1;        % Number of iterations (more results in a more precise final answer)
t0              = 0;        % Initial Time
tf              = 60;        % Final Time (not necessary to adjust)
pos_0           = [-1 -1];  % Initial x, y coordinates
psi_0_span      = linspace(deg2rad(92.85),deg2rad(92.875),50);
psi_repeat_list = psi_0_span;
check_radius    = 0.05;
nip             = 2;        % Number of integration points
V               = 0.1;

x = linspace(-2,2,N_G);
y = linspace(-2,2,N_G);
z = zeros(N_G);
for i = 1:length(x)
    for j = 1:length(y)
        z(i,j)      = c(x(i),y(j));
    end
end




cost_list = [];
radius_array = [0.2 0.1 0.05 0.05];
for N = 1:length(radius_array)
    check_radius = radius_array(N);
    fprintf("---------- Iteration %d of %d ----------\n", N, n_iterations);
    new_repeat_list = 0;
    clf;
    hold on;
    contour(linspace(-2,2,N_G),linspace(-2,2,N_G),z',50); % Contour plot
    %     quiver(linspace(-1,1,N_G), linspace(-1,1,N_G),grad_x,grad_y); % Wind gradient
    %     xlim([1 - 2*check_radius 1 + 2*check_radius]);
    %     ylim([1 - 2*check_radius 1 + 2*check_radius]);
    xlim([0.9 1.1]);
    ylim([0.9 1.1]);
    grid on;
    viscircles([1 1],check_radius);
    
    for current_psi_0 = psi_0_span
        
        %% check whether that line hits the circle
        %% if it does, then sweep in higher resolution
            t         = t0; % initialize t
            step_size = check_radius/3;
            n_steps   = tf/step_size;
            tspan     = t0:step_size:tf;            % Total time span
            currentStates = [pos_0 current_psi_0]'; % State array used inside the loop
            
            for k = 1:n_steps
                t1 = step_size*(k-1);
                t2 = step_size*k;
                temp_tspan = t1:(t2-t1)/nip:t2;
                [tNew,tempStates] = ode45(@(t,y) homework_11_ode...
                    (y,V,psi_dot),...
                    temp_tspan,currentStates);
                t(k) = t2;
                currentStates = tempStates(nip+1,1:3)';
                states_out(k,:) = currentStates';
            end
            
            plot(states_out(:,1),states_out(:,2)); %,'-s'); % Plot calculated trajectory
            drawnow;
for y = 1:length(states_out) % Test whether the trajectory crosses check radius
    if (norm([states_out(y,1) states_out(y,2)] - [1 1]) < check_radius)...
            && (~ismember(current_psi_0,new_repeat_list))
        new_repeat_list = [new_repeat_list current_psi_0];

        path_cost = 0;
        for i = ceil(linspace(1,length(states_out(:,1)),50))
            for j = ceil(linspace(1,length(states_out(:,2)),50))
                path_cost = path_cost + c(states_out(i,1),states_out(j,2));
            end
        end
        cost_list       = [cost_list path_cost];
        break;
    end
end
  
        
        
        
        
    end
    
    drawnow;
    
    psi_repeat_list = new_repeat_list(2:end);
    new_cost_list = cost_list;
    cost_list = [];
    if ~isempty(psi_repeat_list)
        psi_0_span = linspace(min(psi_repeat_list), max(psi_repeat_list), num_psi_0);
    else
        error("step_size or num_psi_0 is too small");
    end
    
    if (rad2deg(norm([psi_repeat_list(1) psi_repeat_list(end)])) < 0.0001) || (length(psi_repeat_list) == 1)
        fprintf('final psi_0 candidate:\n');
        fprintf('%0.4f degrees\n',rad2deg(mean(psi_repeat_list)));
        psi_repeat_list = mean(psi_repeat_list);
    end
    
    
    fprintf('psi_0 candidates\n');
    disp(psi_repeat_list');
    fprintf('path costs:\n');
    disp(new_cost_list');
    fprintf('\n');
%     pause;
end


