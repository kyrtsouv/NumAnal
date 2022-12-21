clc

maximum_error = 1/2*10^-4;

[A,b] = makeAb(10);

resForN10 = gaussSeidel(A,b,maximum_error);

[A,b] = makeAb(10000);

resForN10000 = gaussSeidel(A,b,maximum_error);