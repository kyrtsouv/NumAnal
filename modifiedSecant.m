function [res] = modifiedSecant(f,error,approx1,approx2,approx3)

syms x0 x1 x2;

q(x0,x1) = f(x0)/f(x1);
r(x1,x2) = f(x2)/f(x1);
s(x0,x2) = f(x2)/f(x0);

phi(x0,x1,x2) = x2-(r(x1,x2)*(r(x1,x2)-q(x0,x1))*(x2-x1) + (1-r(x1,x2))*s(x0,x2)*(x2-x0))/((q(x0,x1)-1)*(r(x1,x2)-1)*(s(x0,x2)-1));

reps = 1;
newApproximation = double(phi(approx1,approx2,approx3));
while abs(double(f(newApproximation)))>=error
    approx1 = approx2;
    approx2 = approx3;
    approx3 = newApproximation;
    newApproximation = double(phi(approx1,approx2,approx3));
    reps=reps+1;
end
res = [newApproximation reps];
end