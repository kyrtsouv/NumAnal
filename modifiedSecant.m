function [res] = modifiedSecant(f,error,approx1,approx2,approx3)

    if f(approx1)*f(approx2)*f(approx3)~=0
        syms x y z;
        
        q(x,y) = f(x)/f(y);
        r(y,z) = f(z)/f(y);
        s(x,z) = f(z)/f(x);

        phi(x,y,z) = z - (r(y,z)*(r(y,z)-q(x,y))*(z-y)+(1-r(y,z)*s(x,z)*(z-x)))/((q(x,y)-1)*(r(y,z)-1)*(s(x,z)-1));

        reps = 1;
        newApproximation = double(phi(approx1,approx2,approx3));
        while abs(double(f(newApproximation)))>=error
            approx1 = approx2;
            approx2 = approx3;
            approx3 = newApproximation;
            newApproximation = double(phi(approx1,approx2,approx3));
            reps=reps+1;
        end
        res = [reps newApproximation];

    elseif f(approx1)==0
        res = [0 approx1];
    elseif f(approx2)==0
        res = [0 appro2];
    else
        res = [0 approx3];
    end

end