clc
syms x
A = [
    0 1 0 0 0 0 0 0 1 0 0 0 0 0 0;
    0 0 1 0 1 0 1 0 0 0 0 0 0 0 0;
    0 1 0 0 0 1 0 1 0 0 0 0 0 0 0;
    0 0 1 0 0 0 0 0 0 0 0 1 0 0 0;
    1 0 0 0 0 0 0 0 0 1 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 1 1 0 0 0 0;
    0 0 0 0 0 0 0 0 0 1 1 0 0 0 0;
    0 0 0 1 0 0 0 0 0 0 1 0 0 0 0;
    0 0 0 0 1 1 0 0 0 1 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
    0 0 0 0 0 0 1 1 0 0 1 0 0 0 0;
    0 0 0 0 0 0 0 0 1 0 0 0 0 1 0;
    0 0 0 0 0 0 0 0 0 1 1 0 1 0 1;
    0 0 0 0 0 0 0 0 0 0 0 1 0 1 0;
    ];
n = length(A);
G = zeros(size(A));
error = 1/2*10^-5;
q = 0.02;
for i=1:n
    for j=1:n
        G(i,j) = q/n + A(j,i)*(1-q)/sum(A(j,:));
    end
end

p = powerMethod(G,error);
p = p/sum(p);


q = 0.6;
for i=1:n
    for j=1:n
        G(i,j) = q/n + A(j,i)*(1-q)/sum(A(j,:));
    end
end


p2 = powerMethod(G,error);
p2 = p2/sum(p2);