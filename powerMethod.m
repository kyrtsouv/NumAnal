function [eigenVector] = powerMethod(A,error)

n = length(A);
approximation = ones(n,1);

newApproximation = A*approximation;
while abs(newApproximation(1,1)-approximation(1,1)) >= error
    approximation = newApproximation;
    k = 1;
    while newApproximation(k,1) == 0
        k=k+1;
    end
    newApproximation = newApproximation/newApproximation(k,1);
    newApproximation = A*newApproximation;
end


k = 1;
while newApproximation(k,1) == 0
    k=k+1;
end
eigenVector = newApproximation/newApproximation(k,1);
end