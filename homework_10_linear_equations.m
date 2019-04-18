function funs = homework_10_linear_equations(states)

%% x1
funs(1) = states(1) - 5;
funs(2) = states(2) - states(7);
funs(3) = states(3) - states(8);
funs(4) = states(4) - states(9);
funs(5) = states(5) - states(10);
funs(6) = states(6) - states(11);

%% x2
funs(7) = states(8) - states(25);
funs(8) = states(9) - states(26);
funs(9) = states(10) - states(27);
funs(10) = states(11) - states(28);
funs(11) = states(12) - states(29);
funs(12) = states(12) - states(29);

%% p1
funs(13) = states(13) - 0.1 * 5;
funs(14) = states(14) - 0.1 * states(1);
funs(15) = states(15) - 0.1 * states(2);
funs(16) = states(16) - 0.1 * states(3);
funs(17) = states(17) - 0.1 * states(4);
funs(18) = states(17) - 0.1 * states(4);

%% p2
funs(19) = states(19) - 0.05 * states(7) + states(13);
funs(20) = states(20) - 0.05 * states(8) + states(14);
funs(21) = states(21) - 0.05 * states(9) + states(15);
funs(22) = states(22) - 0.05 * states(10) + states(16);
funs(23) = states(23) - 0.05 * states(11) + states(17);
funs(24) = states(23) - 0.05 * states(11) + states(17);

%% u
funs(25) = states(25) - states(20);
funs(26) = states(26) - states(21);
funs(27) = states(27) - states(22);
funs(28) = states(28) - states(23);
funs(29) = states(28) - states(23);
funs(29) = states(28) - states(23);

