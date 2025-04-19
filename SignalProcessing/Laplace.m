% Compute Laplace's transform for a defined group of functions
% @author: Jeysson4K
% Signals and Systems I


clc;
clear;

% Define dynamic varaibles
a=3; b=0; c=0; d=0; e=0; f=0; g=0;

% Actual variables x(t) and X(s)
syms s t

% Define the functions
x0 = dirac(t);
x1 = heaviside(t);
x2 = exp(-2*t) * heaviside(t);
x3 = sinh(a*t);
x4 = cos(t) * heaviside(t);

% Compute the Laplace's transform for each function
x = [x0, x1, x2, x3, x4];

j = 1;
% Loop through each function and compute the Laplace Transform
for i = 1:length(x)
    X = laplace(x(i), t, s);
    
    % Convert expressions to LaTeX
    func_str = latex(x(i));
    laplace_str = latex(X);
    % Display the output in LaTeX format
    disp(j)
    disp(['$$x(t) =' func_str '$$'])
    disp(['$$ \mathcal{X}[x(t)] = ' laplace_str ' $$']);
    disp(' ');
    
    % Extract numerator and denominator
    [num, denom] = numden(X);
    
    % Compute zeros (roots of numerator)
    zeros_X = solve(num, s);
    % Compute poles (roots of denominator)
    poles_X = solve(denom, s);

    % Summary
    disp('Summary');
    disp(['Zeros of $$x(t) = ' func_str '$$']);
    disp(zeros_X)
    disp(['Poles of $$x(t) = ' func_str '$$']);
    disp(poles_X)

    % Find the ROC
    real_poles = real(poles_X);
    rightmost_pole = max(real_poles);
    leftmost_pole = min(real_poles);
    
    % Define the ROC conditions
    disp('Region of Convergence (ROC):');
    disp(['Causal System: ROC is Re(s) > ' char(vpa(rightmost_pole, 4))]);
    disp(['Anti-Causal System: ROC is Re(s) < ' char(vpa(leftmost_pole, 4))]);
    if i < length(x)
        disp(' ');
        disp(' ');
        disp(' ');
    end
    j = j + 1;
end