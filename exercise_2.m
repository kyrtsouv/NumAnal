clc

syms x
f = symfun(94*cos(x)^3-24*cos(x)+177*sin(x)^2-108*sin(x)^4-72*cos(x)^3*sin(x)^2-65,x);

% fplot(f,[0,3])
% grid on

maximum_error = 0.5*10^-5;

modifiedNewtonRoots = [modifiedNewton(f,maximum_error,0.69,0.89,0.89) ; modifiedNewton(f,maximum_error,0.9,1.1,1.1); modifiedNewton(f,maximum_error,2.2,2.4,2.4)]

modifiedBisectionRoots = [modifiedBisection(f,maximum_error,0.69,0.89); modifiedBisection(f,maximum_error,0.9,1.1); modifiedBisection(f,maximum_error,2.2,2.4)]

modifiedSecantRoots = [modifiedSecant(f,maximum_error,0.69,0.89,0.79) ; modifiedSecant(f,maximum_error,0.9,1.2,1.1); modifiedSecant(f,maximum_error,2.2,2.4,2.3)]