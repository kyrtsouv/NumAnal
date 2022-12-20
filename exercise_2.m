clc

syms x
f = symfun(94*cos(x)^3-24*cos(x)+177*sin(x)^2-108*sin(x)^4-72*cos(x)^3*sin(x)^2-65,x);
error = 0.5*10^-5;

modifiedNewtonRoots = [
    modifiedNewton(f,error,0.8);
    modifiedNewton(f,error,1.1);
    modifiedNewton(f,error,2.4)
    ];

modifiedBisectionRoots = [
    modifiedBisection(f,error,0.69,0.89);
    modifiedBisection(f,error,0.9,1.1);
    modifiedBisection(f,error,2.2,2.4)
    ];

modifiedSecantRoots = [
    modifiedSecant(f,error,0.6,0.7,0.8);
    modifiedSecant(f,error,1.2,1.3,1.4);
    modifiedSecant(f,error,2.1,2.4,2.7)
    ];

newtonRoots = [
    newton(f,error,0.8);
    newton(f,error,1.1);
    newton(f,error,2.4)
    ];

bisectionRoots = [
    bisection(f,error,0.69,0.89);
    bisection(f,error,0.9,1.1);
    bisection(f,error,2.2,2.4)
    ];

secantRoots = [
    secant(f,error,0.6,0.7);
    secant(f,error,1.2,1.3);
    secant(f,error,2.1,2.4)
    ];

repsForModifiedBisection = zeros(10,1);
for n=1:10
    temp = modifiedBisection(f,error,0.69,0.89);
    repsForModifiedBisection(n) = temp(1);
end

differenceOfConvergenceSpeedOfBisection = modifiedBisectionRoots-bisectionRoots;
differenceOfConvergenceSpeedOfBisection = differenceOfConvergenceSpeedOfBisection(:,1);

differenceOfConvergenceSpeedOfNewton = modifiedNewtonRoots-newtonRoots;
differenceOfConvergenceSpeedOfNewton = differenceOfConvergenceSpeedOfNewton(:,1);

differenceOfConvergenceSpeedOfSecant = modifiedSecantRoots-secantRoots;
differenceOfConvergenceSpeedOfSecant = differenceOfConvergenceSpeedOfSecant(:,1);
