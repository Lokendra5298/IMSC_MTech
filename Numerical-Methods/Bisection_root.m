clc
clear all

% Setting x as symbolic variable
syms x;

% Input Section
y = input('Enter non-linear equations: ', 's'); % Use 's' to read the equation as a string
a = input('Enter the lower bound of interval: ');
b = input('Enter the upper bound of interval: ');
e = input('Tolerable error: ');

% Define the function from the input equation
f = @(x) eval(vectorize(y));

% Plot the function
fplot(f, [a, b]);
title('Plot of f(x)');
xlabel('x');
ylabel('f(x)');

% Finding Functional Value f(a) and f(b)
fa = f(a);
fb = f(b);

% Implementing Bisection Method
if fa * fb > 0
    disp('Either given interval does not contain the root or roots are imaginary.');
else
    c = (a + b) / 2;
    fc = f(c);
    fprintf('\n\na\t\t\tb\t\t\tc\t\t\tf(c)\n'); % To make a table of a    b    c  f(c)

    while abs(fc) > e
        fprintf('%f\t%f\t%f\t%f\n', a, b, c, fc); % Table values for all iterations
        if fa * fc < 0
            b = c;
        else
            a = c;
        end
        c = (a + b) / 2;
        fc = f(c);
    end
    fprintf('\nRoot is: %f\n', c);
end
