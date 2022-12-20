function [res] = newton(f,error,approximation)
    
syms x;
phi = x-f/diff(f);
reps = 1;
newApproximation = double(phi(approximation));
while abs(newApproximation-approximation)>=error
    approximation = newApproximation;
    newApproximation = double(phi(newApproximation));
    reps=reps+1;
end

res = [reps approximation];   
end