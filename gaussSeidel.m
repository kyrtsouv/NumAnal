function [x] = gaussSeidel(A,b,error)

n = length(A);
approximation = zeros(n,1);
newApproximation = approximation;

for i = 1:n
    sum = 0;
    for j=1:i-1
        sum = sum + A(i,j)*newApproximation(j);
    end
    for j=i+1:n
        sum = sum + A(i,j)*approximation(j);
    end

    newApproximation(i) = (b(i) - sum)/A(i,i);

end

while norm(newApproximation-approximation,"inf") >= error
    approximation = newApproximation;
    for i = 1:n
        sum = 0;
        for j=1:i-1
            sum = sum + A(i,j)*newApproximation(j);
        end
        for j=i+1:n
            sum = sum + A(i,j)*approximation(j);
        end
    
        newApproximation(i) = (b(i) - sum)/A(i,i);
    end
    
end
x = newApproximation;
end