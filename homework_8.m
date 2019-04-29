clc; clear; clf;
hw2_2017_main;

x0 = ones(54,1);
x0(1) = -0;
x0(2) = -0.9;
x0(3) = -0.7;
x0(4) = -0.5;
x0(5) = -0.2;
x0(6) = 0.001;
x0(7) = 0.2;
x0(8) = 0.5;
x0(9) = 0.7;
x0(10)= 0.9;
x0(11)= 1;

x0(12)= -1;
x0(13)= -0.9;
x0(14)= -0.7;
x0(15)= -0.5;
x0(16)= -0.2;
x0(17)= 0.001;
x0(18)= 0.2;
x0(19)= 0.5;
x0(20)= 0.7;
x0(21)= 0.9;
x0(22)= 1;

%states_out = fsolve(@derivatives_question_8,x0);

x = states_out(1:11);
y = states_out(12:22);
psi = states_out(45:54);

hold on;
contour3( linspace(-1,1,N_G), linspace(-1,1,N_G),reshape(threat_value_true,[N_G N_G])',N_G);
plot(x,y,'-r');

figure;
plot([1:10],psi);


