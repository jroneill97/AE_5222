function F=derivatives_question_8(x)

N        = 25;
theta  = threat_parameters_true(1:N);
x1_bar   = threat_basis_data.basis_parameters.mean(1,1:N)';
x2_bar   = threat_basis_data.basis_parameters.mean(1,1:N)';
v_n      = 0.1736^2;
V        = 0.1;

for n=1:25
    dc_dx0  = @(n) ((-1*theta(n)*(x(1) -x1_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(1) -x1_bar(n))^2+(x(12)-x2_bar(n))^2)/(-2*v_n));
    dc_dx1  = @(n) ((-1*theta(n)*(x(2) -x1_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(2) -x1_bar(n))^2+(x(13)-x2_bar(n))^2)/(-2*v_n));
    dc_dx2  = @(n) ((-1*theta(n)*(x(3) -x1_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(3) -x1_bar(n))^2+(x(14)-x2_bar(n))^2)/(-2*v_n));
    dc_dx3  = @(n) ((-1*theta(n)*(x(4) -x1_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(4) -x1_bar(n))^2+(x(15)-x2_bar(n))^2)/(-2*v_n));
    dc_dx4  = @(n) ((-1*theta(n)*(x(5) -x1_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(5) -x1_bar(n))^2+(x(16)-x2_bar(n))^2)/(-2*v_n));
    dc_dx5  = @(n) ((-1*theta(n)*(x(6) -x1_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(6) -x1_bar(n))^2+(x(17)-x2_bar(n))^2)/(-2*v_n));
    dc_dx6  = @(n) ((-1*theta(n)*(x(7) -x1_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(7) -x1_bar(n))^2+(x(18)-x2_bar(n))^2)/(-2*v_n));
    dc_dx7  = @(n) ((-1*theta(n)*(x(8) -x1_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(8) -x1_bar(n))^2+(x(19)-x2_bar(n))^2)/(-2*v_n));
    dc_dx8  = @(n) ((-1*theta(n)*(x(9) -x1_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(9) -x1_bar(n))^2+(x(20)-x2_bar(n))^2)/(-2*v_n));
    dc_dx9  = @(n) ((-1*theta(n)*(x(10)-x1_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(10)-x1_bar(n))^2+(x(21)-x2_bar(n))^2)/(-2*v_n));
    dc_dx10 = @(n) ((-1*theta(n)*(x(11)-x1_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(11)-x1_bar(n))^2+(x(22)-x2_bar(n))^2)/(-2*v_n));


    dc_dy0  = @(n) ((-1*theta(n)*(x(12)-x2_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(1) -x1_bar(n))^2+(x(12)-x2_bar(n))^2)/(-2*v_n));
    dc_dy1  = @(n) ((-1*theta(n)*(x(13)-x2_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(2) -x1_bar(n))^2+(x(13)-x2_bar(n))^2)/(-2*v_n));
    dc_dy2  = @(n) ((-1*theta(n)*(x(14)-x2_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(3) -x1_bar(n))^2+(x(14)-x2_bar(n))^2)/(-2*v_n));
    dc_dy3  = @(n) ((-1*theta(n)*(x(15)-x2_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(4) -x1_bar(n))^2+(x(15)-x2_bar(n))^2)/(-2*v_n));
    dc_dy4  = @(n) ((-1*theta(n)*(x(16)-x2_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(5) -x1_bar(n))^2+(x(16)-x2_bar(n))^2)/(-2*v_n));
    dc_dy5  = @(n) ((-1*theta(n)*(x(17)-x2_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(6) -x1_bar(n))^2+(x(17)-x2_bar(n))^2)/(-2*v_n));
    dc_dy6  = @(n) ((-1*theta(n)*(x(18)-x2_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(7) -x1_bar(n))^2+(x(18)-x2_bar(n))^2)/(-2*v_n));
    dc_dy7  = @(n) ((-1*theta(n)*(x(19)-x2_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(8) -x1_bar(n))^2+(x(19)-x2_bar(n))^2)/(-2*v_n));
    dc_dy8  = @(n) ((-1*theta(n)*(x(20)-x2_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(9) -x1_bar(n))^2+(x(20)-x2_bar(n))^2)/(-2*v_n));
    dc_dy9  = @(n) ((-1*theta(n)*(x(21)-x2_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(10)-x1_bar(n))^2+(x(21)-x2_bar(n))^2)/(-2*v_n));
    dc_dy10 = @(n) ((-1*theta(n)*(x(22)-x2_bar(n)))/(sqrt(2*pi)*v_n^1.5))*exp(((x(11)-x1_bar(n))^2+(x(12)-x2_bar(n))^2)/(-2*v_n));
end

%% Function System
%x1(k+1)
F(1) = x(1) +1;
F(2) = x(2) -V*cos(x(45))-x(1);
F(3) = x(3) -V*cos(x(46))-x(2);
F(4) = x(4) -V*cos(x(47))-x(3);
F(5) = x(5) -V*cos(x(48))-x(4);
F(6) = x(6) -V*cos(x(49))-x(5);
F(7) = x(7) -V*cos(x(50))-x(6);
F(8) = x(8) -V*cos(x(51))-x(7);
F(9) = x(9) -V*cos(x(52))-x(8);
F(10)= x(10)-V*cos(x(53))-x(9);
F(11)= x(11)-V*cos(x(54))-x(10);

%x2(k+1)
F(12) = x(12)+1;
F(13) = x(13)-V*sin(x(45))-x(12);
F(14) = x(14)-V*sin(x(46))-x(13);
F(15) = x(15)-V*sin(x(47))-x(14);
F(16) = x(16)-V*sin(x(48))-x(15);
F(17) = x(17)-V*sin(x(49))-x(16);
F(18) = x(18)-V*sin(x(50))-x(17);
F(19) = x(19)-V*sin(x(51))-x(18);
F(20) = x(20)-V*sin(x(52))-x(19);
F(21) = x(21)-V*sin(x(53))-x(20);
F(22) = x(22)-V*sin(x(54))-x(21);

%p1(k+1)

F(23) = x(24)-x(23)+dc_dx0(n);
F(24) = x(25)-x(24)+dc_dx1(n);
F(25) = x(26)-x(25)+dc_dx2(n);
F(26) = x(27)-x(26)+dc_dx3(n);
F(27) = x(28)-x(27)+dc_dx4(n);
F(28) = x(29)-x(28)+dc_dx5(n);
F(29) = x(30)-x(29)+dc_dx6(n);
F(30) = x(31)-x(30)+dc_dx7(n);
F(31) = x(32)-x(31)+dc_dx8(n);
F(32) = x(33)-x(32)+dc_dx9(n);

%P1(N)
F(33) = x(33)-x(11)-dc_dx10(n)+1;

%p2(k+1)
%%

F(34) = x(35)-x(34)+dc_dy0(n);
F(35) = x(36)-x(35)+dc_dy1(n);
F(36) = x(37)-x(36)+dc_dy2(n);
F(37) = x(38)-x(37)+dc_dy3(n);
F(38) = x(39)-x(38)+dc_dy4(n);
F(39) = x(40)-x(39)+dc_dy5(n);
F(40) = x(41)-x(40)+dc_dy6(n);
F(41) = x(42)-x(41)+dc_dy7(n);
F(42) = x(43)-x(42)+dc_dy8(n);
F(43) = x(44)-x(43)+dc_dy9(n);

%P2(N)
F(44) = x(44)-x(22)-dc_dy10(n)+1;

%tan(u)(k)=P2(k+1)/P1(k+1)
F(45) = x(45)-atan(x(34)/x(23));
F(46) = x(46)-atan(x(35)/x(24));
F(47) = x(47)-atan(x(36)/x(25));
F(48) = x(48)-atan(x(37)/x(26));
F(49) = x(49)-atan(x(38)/x(27));
F(50) = x(50)-atan(x(39)/x(28));
F(51) = x(51)-atan(x(40)/x(29));
F(52) = x(52)-atan(x(41)/x(30));
F(53) = x(53)-atan(x(42)/x(31));
F(54) = x(54)-atan(x(43)/x(32));
end