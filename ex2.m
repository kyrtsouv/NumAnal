clc

syms x
f = symfun(94*cos(x)^3-24*cos(x)+177*sin(x)^2-108*sin(x)^4-72*cos(x)^3*sin(x)^2-65,x);
error = 0.5*10^-5;

modifiedBisectionRoots = [
    modifiedBisection(f,error,0.69,0.89);
    modifiedBisection(f,error,0.9,1.1);
    modifiedBisection(f,error,2.2,2.4)
    ];

modifiedNewtonRoots = [
    modifiedNewton(f,error,0.8);
    modifiedNewton(f,error,1.1);
    modifiedNewton(f,error,2.4)
    ];

modifiedSecantRoots = [
    modifiedSecant(f,error,0.6,0.7,0.8);
    modifiedSecant(f,error,1.2,1.3,1.4);
    modifiedSecant(f,error,2.1,2.4,2.7)
    ];

bisectionRoots = [
    bisection(f,error,0.69,0.89);
    bisection(f,error,0.9,1.1);
    bisection(f,error,2.2,2.4)
    ];

newtonRoots = [
    newton(f,error,0.8);
    newton(f,error,1.1);
    newton(f,error,2.4)
    ];

secantRoots = [
    secant(f,error,0.6,0.7);
    secant(f,error,1.2,1.3);
    secant(f,error,2.1,2.4)
    ];

repsOfModifiedBisection = zeros(10,1);
for n=1:10
    temp = modifiedBisection(f,error,0.69,0.89);
    repsOfModifiedBisection(n) = temp(2);
end

differenceOfConvergenceSpeedOfBisection = modifiedBisectionRoots-bisectionRoots;
differenceOfConvergenceSpeedOfBisection = differenceOfConvergenceSpeedOfBisection(:,2);

differenceOfConvergenceSpeedOfNewton = modifiedNewtonRoots-newtonRoots;
differenceOfConvergenceSpeedOfNewton = differenceOfConvergenceSpeedOfNewton(:,2);

differenceOfConvergenceSpeedOfSecant = modifiedSecantRoots-secantRoots;
differenceOfConvergenceSpeedOfSecant = differenceOfConvergenceSpeedOfSecant(:,2);
