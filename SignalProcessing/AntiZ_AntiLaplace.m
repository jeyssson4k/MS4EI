clc;
clear;

% Anti-Laplace Transform
syms s t
X_s = [(s+3)/((s+11)*(s+13))];
x_t = ilaplace(X_s, s, t);
disp(x_t);

% Anti-Z Transform
syms z n
assume(n, 'integer')

%X_z = (10 - 1/(12*z))/((1-1/(9*z))*(1-1/(14*z)));
X_z = [5*((1/2)^n)+10*((1/4)^n) (1/6)^n];
x_n = iztrans(X_z, z, n)*heaviside(n)
%disp(x_n);


syms t s % Actual variables x(t) and X(s)


T = [3*exp(-12*t)*heaviside(t)+10*exp(-10*t)*heaviside(t)];
S = laplace(T);


N = [5*((1/32)^n)+10*((1/4)^n)  (1/6)^n];
% Compute symbolic z-transform
Z = ztrans(N);

