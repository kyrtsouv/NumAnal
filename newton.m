function [res] = newton(f,error,approximation)
    
syms x;
phi = x-f/diff(f);
reps = 0;
while abs(double(f(approximation)))>=error
    approximation = double(phi(approximation));
    reps=reps+1;
end
der=diff(f);
quadraticConvergence = abs(double(der(approximation)))>error;

res = [reps approximation quadraticConvergence];   
end