clc
syms x
f = symfun(exp(sin(x)^3)+x^6-2*x^4-x^3-1,x);

% fplot(f,[-2 2]);
% xlabel('x')
% ylabel('e^{sin^3x}+x^6-2x^4-x^3-1')
% grid on

error = 0.5*10^-5;

bisectionRoots = [bisection(f,error,-2,-1); bisection(f,error,1,2)];

newtonRoots = [newton(f,error,-1); newton(f,error,2)];

secantRoots = [secant(f,error,1.3,2)];