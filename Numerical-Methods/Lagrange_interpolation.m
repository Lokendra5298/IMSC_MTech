% Given values
n = 10;
a = 0;
b = pi;
h = (b - a) / n;

% Initialize the result to 0
result = 0.0;
% define function
f = @(x) sin(x)
% Calculate f(a) and f(b)
f_a = f(a);
f_b = f(b);

% Calculate the sum of f(x_i) for i = 1 to n-1
sum_f_x_i = 0.0;
for i = 1:n-1
    x_i = a + i * h;
    sum_f_x_i = sum_f_x_i + f(x_i);
end

% Calculate the result using the formula
result = h * (f_a / 2 + f_b / 2 + sum_f_x_i);

% Print the result
fprintf('Result: %f\n', result);
