function f = homework_10_linear_equations(states_)

%% x1
f(1) = states_(1)  - 5;
f(2) = states_(2)  - states_(7);
f(3) = states_(3)  - states_(8);
f(4) = states_(4)  - states_(9);
f(5) = states_(5)  - states_(10);
f(6) = states_(6)  - states_(11);

%% x2
f(7) = states_(7)  - 2;
f(8) = states_(8)  - states_(25);
f(9) = states_(9)  - states_(26);
f(10) = states_(10) - states_(27);
f(11) = states_(11) - states_(28);
f(12) = states_(12) - states_(29);

%% p1
f(13) = states_(13) - 0.1 * states_(1);
f(14) = states_(14) - 0.1 * states_(2);
f(15) = states_(15) - 0.1 * states_(3);
f(16) = states_(16) - 0.1 * states_(4);
f(17) = states_(17) - 0.1 * states_(5);
f(18) = states_(18) - 0.1 * states_(6);

%% p2
f(19) = states_(19) - 0.05 * states_(7) + states_(13);
f(20) = states_(20) - 0.05 * states_(8) + states_(14);
f(21) = states_(21) - 0.05 * states_(9) + states_(15);
f(22) = states_(22) - 0.05 * states_(10) + states_(16);
f(23) = states_(23) - 0.05 * states_(11) + states_(17);
f(24) = states_(24) - 0.05 * states_(13);

%% u
f(25) = states_(25) - states_(20);
f(26) = states_(26) - states_(21);
f(27) = states_(27) - states_(22);
f(28) = states_(28) - states_(23);
f(29) = states_(29) - states_(24);

