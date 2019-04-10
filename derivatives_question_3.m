function dL_d_ = derivatives_question_3(state_array)

    x1 = state_array(1);
    x2 = state_array(2);
    x3 = state_array(3);
    p1 = state_array(4);
    p2 = state_array(5);
    p3 = state_array(6);
    s1 = state_array(7);
    s2 = state_array(8);
    s3 = state_array(9);
    
    dL_dx1 = 2*p1*x1 - 12*x1 + 3*x1^2 - (p2*x1)/(x1^2 + x2^2 + x3^2)^(1/2) + 11;
    dL_dx2 = 2*p1*x2 - (p2*x2)/(x1^2 + x2^2 + x3^2)^(1/2);
    dL_dx3 = p3 - 2*p1*x3 - (p2*x3)/(x1^2 + x2^2 + x3^2)^(1/2) + 1;
    dL_dp1 = s1^2 + x1^2 + x2^2 - x3^2;
    dL_dp2 = s2^2 - (x1^2 + x2^2 + x3^2)^(1/2) + 2;
    dL_dp3 = x3 + s3^2 - 5;
    dL_ds1 = 2*p1*s1;
    dL_ds2 = 2*p2*s2;
    dL_ds3 = 2*p3*s3;
    
    dL_d_(1) = dL_dx1;
    dL_d_(2) = dL_dx2;
    dL_d_(3) = dL_dx3;
    dL_d_(4) = dL_dp1;
    dL_d_(5) = dL_dp2;
    dL_d_(6) = dL_dp3;
    dL_d_(7) = dL_ds1;
    dL_d_(8) = dL_ds2;
    dL_d_(9) = dL_ds3;
    
end