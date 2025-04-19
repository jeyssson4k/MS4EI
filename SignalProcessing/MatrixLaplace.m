% Compute Laplace's transform for a defined group of functions
% @author: Jeysson4K
% Signals and Systems I

clc;
clear;

syms t s % Actual variables x(t) and X(s)
syms a b c positive % Positive literal numbers
syms d e f negative % Negative literal numbers

T = [3*];
S = laplace(T);

[m, n] = size(S); % Get matrix dimensions
ZS = cell(n, m);  % Store Zeros of Laplace Transforms
PS = cell(n, m);  % Store Poles of Laplace Transforms

for j = 1:n
    for i = 1:m 
        % Extract numerator and denominator
        [num, denom] = numden(S(i,j));
        % Compute zeros (roots of numerator)
        roots_num = solve(num, s);
        % Compute poles (roots of denominator)
        roots_denom = solve(denom, s);

        % Just in case there are no roots, then avoid an error
        if isempty(roots_num)
            ZS{i, j} = {}; % Use cell array to store variable-sized data
        else
            ZS{i, j} = {roots_num};
        end

        % Just in case there are no poles, then avoid an error
        if isempty(roots_denom)
            PS{i, j} = {};
        else
            PS{i, j} = {roots_denom};
        end
    end
end


% Show I/O
T
S
ZS
PS