function [res] = bisection(f,error,a,b)

if f(a)*f(b)<0
    for reps=1:ceil(log((b-a)/error)/log(2))
        approximation = (b+a)/2;
        if f(approximation) == 0
            break
        elseif f(approximation)*f(a)<0
            b = approximation;
        else
            a = approximation;
        end
    end
    res = [reps approximation];
else
    res = [0 NaN];
end     
end