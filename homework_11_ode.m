function states_dot = homework_11_ode(states,V,psi_dot)
    x   = states(1);
    y   = states(2);
    psi = states(3); 
    
    x_dot       = V*cos(psi);
    y_dot       = V*sin(psi);
    psi_dot_out = psi_dot(psi,x,y);
    
    states_dot = [x_dot; y_dot; psi_dot_out];    
end