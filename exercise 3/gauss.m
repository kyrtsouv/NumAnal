function [x] = gauss(A,b)

s = size(b);
if s(1,1) == 1
    b = transpose(b);
end

U = A;
n = length(U);
P = eye(n);
L = P;

for k = 1:n
    max = abs(U(k,k));
    maxRow = k;
    for l = k+1:n
        if abs(U(l,k))>max
            max = abs(U(l,k));
            maxRow = l;
        end
    end
    temp = U(k,:);
    U(k,:) = U(maxRow,:);
    U(maxRow,:) = temp;

    temp = P(k,:);
    P(k,:) = P(maxRow,:);
    P(maxRow,:) = temp;
end

for k = 1:n
    for l = k+1:n
        m = U(l,k)/U(k,k);
        U(l,:) = -m*U(k,:)+U(l,:);
        L(l,k) = m;
    end
end

z = P*b;
y = zeros(n,1);
y(1) =z (1) / L(1,1);
for k = 2:n
    sum = 0;
    for l = 1:k-1
        sum = sum + y(l) * L(k,l);
    end
    y(k) = (z(k) - sum) / L(k,k);
end


x = zeros(n,1);
x(n) = y(n) / U(n,n);
for k = n-1:-1:1
    sum = 0;
    for l = n:-1:k+1
        sum = sum + x(l) * U(k,l);
    end
    x(k) = (y(k) - sum) / U(k,k);
end

end