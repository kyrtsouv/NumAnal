function [res] = modifiedBisection(f,error,start,finish)   
    if f(start)*f(finish)<0
        approximation = rand*(finish-start)+start;
        reps = 1;
            
        while abs(double(f(approximation))) >= error
            if f(approximation)*f(start)<0
                finish = approximation;
            else 
                start = approximation;
            end
            approximation = rand*(finish-start)+start;
            reps = reps+1;
        end
        res = [reps approximation];
    elseif f(start)==0
        res = [0 start];
    elseif f(finish)==0
        res = [0 finish];
    else
        res = [0 NaN];
    end     
end