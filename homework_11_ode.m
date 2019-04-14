function states_dot = homework_11_ode(states,V,w_x,w_y,N_G,psi_dot)
    x   = states(1);
    y   = states(2);
    psi = states(3); 
   
    w_x_current = w_x(x,y);
    w_y_current = w_y(x,y);
        
    x_dot       = V*cos(psi) + w_x_current;
    y_dot       = V*sin(psi) + w_y_current;
    psi_dot_out = psi_dot(psi,x,y);
    
    states_dot = [x_dot; y_dot; psi_dot_out];    
end