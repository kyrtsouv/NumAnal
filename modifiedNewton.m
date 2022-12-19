function [res] = modifiedNewton(f,error,approx1)

syms x;
phi = x-1/(diff(f)/f-0.5*diff(diff(f))/diff(f));
reps = 0;
approx2 = double(phi(approx1));
while abs(double(approx2-approx1))>=error
    approx1 = approx2;
    approx2 = double(phi(approx2));
    reps=reps+1;
end
der=diff(f);
quadraticConvergence = abs(double(der(approx2)))>error;

res = [reps approx2 quadraticConvergence];
end