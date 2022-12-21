function [res] = newton(f,error,approximation)
    
syms x;
phi = x-f/diff(f);
reps = 1;
newApproximation = double(phi(approximation));

difference = abs(newApproximation-approximation);

while difference>=error
    approximation = newApproximation;
    newApproximation = double(phi(newApproximation));
    if abs(newApproximation-approximation)>difference
        reps = 0;
        newApproximation = NaN;
        break
    end
    difference = abs(newApproximation-approximation);
    reps=reps+1;
end

res = [newApproximation reps];
end