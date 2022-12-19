function [res] = modifiedNewton(f,error,start,finish,approximation)
    
    if f(start)*f(finish)<0
        syms x;
        phi = x-1/(diff(f)/f-0.5*diff(diff(f))/diff(f));
        reps = 0;
        while abs(double(f(approximation)))>=error
            approximation = double(phi(approximation));
            reps=reps+1;
        end
        der=diff(f);
        res = [reps approximation abs(double(der(approximation)))>error];

    elseif f(start)==0
        res = [0 start NaN];
    elseif f(finish)==0
        res = [0 finish NaN];
    else
        res = [0 NaN NaN];
    end     
end