function [res] = modifiedNewton(f,error,approximation)

syms x;
phi = x-1/(diff(f)/f-0.5*diff(diff(f))/diff(f));

newApproximation = double(phi(approximation));
reps = 1;
while abs(newApproximation-approximation)>=error
    approximation = newApproximation;
    newApproximation = double(phi(newApproximation));
    reps=reps+1;
end

res = [reps newApproximation];
end