clc; clear; clf;

SA = @(x1,x2,x3) 2.*x3.*(x1+x2) + x1.*x2;
V = 1;
x1 = (2*V)^(1/3)
x2 = (2*V)^(1/3)
x3 = V/(2*V)^(2/3)
hold on;
plot(linspace(-1,1),linspace(1,1));
plot(linspace(-1,1),SA(linspace(x1-1,x1+1),linspace(x2-1,x2+1),linspace(x3-1,x3+1)));
plot(linspace(-1,1),linspace(x1-1,x1+1).*linspace(x2-1,x2+1).*linspace(x3-1,x3+1));
scatter(0,SA(x1,x2,x3));

drawnow;