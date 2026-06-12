% Initialize w as an empty vector
n = 10;
w = [];

% For k = 1:n-1, calculate wk and append it to w
for k = 1:n-1
    wk = cos(k/n + 1/2*n)*pi;
    w = [w wk];
end

% For all elements of w, find the values of f(x) = 1/(1+25*x^2)
y = 1./(1+w.^2);
x = w;

% Initialize the product of the terms
p = 1;

% Loop over each data point
for i = 1:length(x)
    % Compute the coefficient of the term
    c = 1;
    for j = 1:length(x)
        if j ~= i
            c = conv(c, poly(x(j))) / (x(i) - x(j));
        end
    end
    % Multiply the term by the corresponding y value
    term = c * y(i);
    % Multiply the term by the product of the terms
    p = conv(p, term);
end

% Display the coefficients of the polynomial
disp(p);

% Define a new vector of x values
x_new = -1:0.01:1; % vector of x values in the range of -1 to 1

% Compute y values for the sum polynomial
y_sum = polyval(p, x_new);

% Compute y values for 1/(1+25*x^2)
y_original = 1./(1+x_new.^2);

% Plot the results
plot(x_new, y_sum, x_new, y_original);
legend('Sum Polynomial', '1/(1+25*x^2)');
