function [res] = modifiedBisection(f,error,start,finish)

approximation = rand*(finish-start)+start;
reps = 1;
if double(f(approximation))~= 0
    if f(approximation)*f(start)<0
        finish = approximation;
    else
        start = approximation;
    end
    newApproximation = rand*(finish-start)+start;
    reps = 2;

    while abs(newApproximation-approximation) >= error
        approximation = newApproximation;
        if f(approximation)*f(start)<0
            finish = approximation;
        else
            start = approximation;
        end
        newApproximation = rand*(finish-start)+start;
        reps = reps+1;
    end
    approximation = newApproximation;
end
res = [reps approximation];
end