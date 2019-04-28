clc; clear; clf;

hw2_2017_main;
generate_functions;

t0 = 0;
tf = 30;
load psi_repeat_list.mat;

pos_0 = [-1 -1];

hold on;
grid on;

for psi_0 = psi_repeat_list
    t         = t0; % initialize t
    step_size = 0.1;
    n_steps   = tf/step_size;
    tspan     = t0:step_size:tf;            % Total time span
    currentStates = [pos_0 psi_0]'; % State array used inside the loop
    
    for k = 1:n_steps
        t1 = step_size*(k-1);
        t2 = step_size*k;
        temp_tspan = t1:(t2-t1)/2:t2;
        [tNew,tempStates] = ode45(@(t,y) homework_11_ode...
            (y,V,psi_dot),...
            temp_tspan,currentStates);
        t(k) = t2;
        currentStates = tempStates(2+1,1:3)';
        states_out(k,:) = currentStates';
    end
    
    subplot(3,1,1);
        title('Costate equations vs. time');
        hold on;
        plot(t,p1(states_out(:,3),states_out(:,1),states_out(:,2)));
        xlabel('time (s)');
        ylabel('p1(x,y,psi)');
        grid on;
    subplot(3,1,2);
        hold on;
        plot(t,p2(states_out(:,3),states_out(:,1),states_out(:,2)));
        xlabel('time (s)');
        ylabel('p2(x,y,psi)');
        grid on;
    subplot(3,1,3);
        title('Hamiltonian equation vs. time');
        hold on;
        plot(t,H(states_out(:,3),states_out(:,1),states_out(:,2)));
        xlabel('time (s)');
        ylabel('H(x,y,psi)');
        grid on;
        ylim([-1 1]);
    
    drawnow;
end