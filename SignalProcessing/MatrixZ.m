% Compute Z's transform for a defined group of functions
% @author: Jeysson4K
% Signals and Systems I


% Important considerations:
% If the function includes u[n+k] it is highly recommend:
% To expressing the function in terms without u[n];
% If the function returns the ztrans declaration:
% Try to refactor the function specially when |t| (t as any variable)
% Is in the function;
% Try to split the function into two or more functions and calculate
% their z-transform if the original function does not compute;
% It is also strongly recommend that the function x[n] is defined
% 0 <= n < inf instead of -inf < n <= -1 or everything else that
% Includes negative numbers for n (anti-causal systems)

clc;
clear;

syms n z % Actual variables x[n] and X[z]
syms a b c positive % Positive literal numbers
syms d e f negative % Negative literal numbers

% Assumptions to optimise the symbolic computation in discrete-time
assume(n, 'integer');

% Functions declaration
y = sym(1/3);

%N = [(a^n) -(a^(-n-1)); ...
%    7*(y^n)-6*((1/2)^n) (y^n)*sin(pi*n/4); ...
%     b^n  1/b^n];

N = [9*((1/3)^n)+3*((1/4)^n)  (1/8)^n];
% Compute symbolic z-transform
Z = ztrans(N);

% Show I/O
N
Z

[h, p] = size(Z); % Get matrix dimensions
for j = 1:p
    for i = 1:h 
        [num, denom] = numden(Z(i,j)); % Get denominator of X(z)
        poles = solve(denom, z);  % Find poles
        
        % Define the ROC as |z| > max(|poles|)
        roc = ['|z| ~ ', char(max(abs(poles)))];
        fprintf('Region of Convergence %d,%d: ', i,j);
        disp(roc);
    end
end