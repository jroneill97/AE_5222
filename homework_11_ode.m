function states_dot = homework_11_ode(states,cost,g1,g2,dw_x_dx,dw_x_dy,dw_y_dx,dw_y_dy,N_G)
    x   = states(1);
    y   = states(2);
    psi = states(3); 
    
    [~,x_index] = min(abs(x - linspace(-1,1,N_G)));
    [~,y_index] = min(abs(y - linspace(-1,1,N_G)));
    
    w_x = g1(x_index,y_index);
    w_y = g2(x_index,y_index);
    
    dw_x_dx = dw_x_dx(x_index,y_index);
    dw_x_dy = dw_x_dy(x_index,y_index);
    
    dw_y_dx = dw_y_dx(x_index,y_index);
    dw_y_dy = dw_y_dy(x_index,y_index);
    
    x_dot   = (0.1)*cos(psi) + w_x;
    y_dot   = (0.1)*sin(psi) + w_y;
    psi_dot = dw_y_dx*sin(psi)^2 - dw_x_dy*cos(psi)^2 + ...
              (dw_x_dx - dw_y_dy)*sin(psi)*cos(psi);
    
    states_dot = [x_dot; y_dot; psi_dot];    
end