clc; clear; clf;
hw2_2017_main;

x0 = ones(54,1);
x0(1)=-1;
x0(2)=-.8;
x0(3)=-.6;
x0(4)=-.4;
x0(5)=-.2;
x0(6)=.001;
x0(7)=.2;
x0(8)=.4;
x0(9)=.6;
x0(10)=.8;
x0(11)=1;

x0(12)=-1;
x0(13)=-.8;
x0(14)=-.6;
x0(15)=-.4;
x0(16)=-.2;
x0(17)=.001;
x0(18)=.2;
x0(19)=.4;
x0(20)=.6;
x0(21)=.8;
x0(22)=1;

states_out = fsolve(@derivatives_question_8,x0);

x = states_out(1:11);
y = states_out(12:22);
psi = states_out(45:54);

hold on;
contour3( linspace(-1,1,N_G), linspace(-1,1,N_G),reshape(threat_value_true,[N_G N_G])',N_G);
plot(x,y,'-r');


