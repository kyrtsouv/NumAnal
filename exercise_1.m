clc
syms x
f = symfun(exp(sin(x)^3)+x^6-2*x^4-x^3-1,x);

hold on
legend([fplot(f,[-2 2]),fplot(diff(f),[-2 2])],'f(x)','f''(x)','Location','northwest')
grid on
hold off


error = 0.5*10^-5;

bisectionRoots = [
    bisection(f,error,-2,-1);
    bisection(f,error,1.3,2)
    ]

newtonRoots = [
    newton(f,error,-2);
    newton(f,error,-0.5);
    newton(f,error,2)
    ]

secantRoots = [
    secant(f,error,-2,-1);
    secant(f,error,-1,1);
    secant(f,error,1.3,2)
    ]