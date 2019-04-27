function funs = homework_10_linear_equations(x)

%% x1
funs(1)  = x(1)   - 5;
funs(2)  = x(2)   - x(7);
funs(3)  = x(3)   - x(8);
funs(4)  = x(4)   - x(9);
funs(5)  = x(5)   - x(10);
funs(6)  = x(6)   - x(11);

%% x2
funs(7)  = x(8)   - x(25);
funs(8)  = x(9)   - x(26);
funs(9)  = x(10)  - x(27);
funs(10) = x(11) - x(28);
funs(11) = x(12) - x(29);
funs(12) = x(12) - x(29);

%% p1
funs(13) = x(13) - 0.1 * 5;
funs(14) = x(14) - 0.1 * x(1);
funs(15) = x(15) - 0.1 * x(2);
funs(16) = x(16) - 0.1 * x(3);
funs(17) = x(17) - 0.1 * x(4);
funs(18) = x(17) - 0.1 * x(4);

%% p2
funs(19) = x(19) - 0.05 * x(7) + x(13);
funs(20) = x(20) - 0.05 * x(8) + x(14);
funs(21) = x(21) - 0.05 * x(9) + x(15);
funs(22) = x(22) - 0.05 * x(10) + x(16);
funs(23) = x(23) - 0.05 * x(11) + x(17);
funs(24) = x(23) - 0.05 * x(11) + x(17);

%% u
funs(25) = x(25) - x(20);
funs(26) = x(26) - x(21);
funs(27) = x(27) - x(22);
funs(28) = x(28) - x(23);
funs(29) = x(28) - x(23);
funs(29) = x(28) - x(23);

