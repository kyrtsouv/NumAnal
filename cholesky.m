function [L] = cholesky(A)

n = length(A);

L = zeros(n);
for i=1:n
    for j=1:i-1
        sum = 0;
        for k=1:j-1
            sum = sum + L(i,k)*L(j,k);
        end
        L(i,j) = (A(i,j)-sum)/L(j,j);
    end
    sum = 0;
    for k = 1:i-1
        sum = sum + L(i,k)^2;
    end
    L(i,i) = sqrt(A(i,i)-sum);
end

end