function [res] = secant(f,error,approx1,approx2)

syms x y;
phi(x,y) = y - f(y)*(y-x)/(f(y)-f(x));

reps = 0;
while abs(approx2-approx1)>=error
    temp = approx1;
    approx1 = approx2;
    approx2 = double(phi(temp,approx2));
    reps=reps+1;
end

res = [approx2 reps];
end