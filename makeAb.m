function [A,b] = makeAb(n)

A = 5*eye(n);
A(2:end,1:end-1) = A(2:end,1:end-1) + -2*eye(n-1);
A(1:end-1,2:end) = A(1:end-1,2:end) + -2*eye(n-1);

b = ones(n,1);
b(1) = 3;
b(end) = 3;

end