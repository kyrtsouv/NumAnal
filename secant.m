function [res] = secant(f,error,approx1,approx2)

    if f(approx1)*f(approx2)<0
        syms x y;
        phi(x,y) = y - f(y)*(y-x)/(f(y)-f(x));
        
        reps = 1;
        newApproximation = double(phi(approx1,approx2));
        while abs(newApproximation-approx2)>=error
            approx1 = approx2;
            approx2 = newApproximation;
            newApproximation = double(phi(approx1,approx2));
            reps=reps+1;
        end
        res = [reps newApproximation];
    elseif f(approx1)==0
        res = [0 approx1];
    elseif f(approx2)==0
        res = [0 appro2];
    else
        res = [0 NaN];
    end
end