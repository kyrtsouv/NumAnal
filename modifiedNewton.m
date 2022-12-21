function [res] = modifiedNewton(f,error,approximation)
    
syms x;
phi = x-1/(diff(f)/f-0.5*diff(diff(f))/diff(f));
newApproximation = double(phi(approximation));
reps = 1;

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