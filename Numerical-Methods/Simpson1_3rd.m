% Given values
n = 10;
x_0 = 0;
h = pi / n;

% Initialize the result to 0
result = 0.0;

% Calculate f(x_i) for i = 0 to n
f_x_i = zeros(1, n + 1);
for i = 0:n
    x_i = x_0 + i * h;
    f_x_i(i + 1) = exp(x_i);
end

% Calculate the sum of f(x_i) for i = 1 to n-1 with weights
sum_f_x_i = 0.0;
for i = 1:n-1
    % Assign weight of 2 or 4 depending on odd or even index
    if mod(i, 2) == 0
        weight = 2;
    else
        weight = 4;
    end
    sum_f_x_i = sum_f_x_i + weight * f_x_i(i + 1);
end

% Calculate the result using the formula
result = h / 3 * (f_x_i(1) + f_x_i(n + 1) + sum_f_x_i);

% Print the result
fprintf('Result: %f\n', result);
