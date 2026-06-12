% Chebyshev Economization Problem

% Define the function to be approximated
f = @(x) exp(x);

% Define the degree of the polynomial
degree = 5;

% Chebyshev nodes
chebNodes = cos((2*(1:degree) - 1) * pi / (2*degree));

% Compute the Chebyshev coefficients
chebCoefficients = chebyshevEconomization(f, degree, chebNodes);

% Evaluate the Chebyshev polynomial
x_vals = linspace(-1, 1, 1000);
approximated_values = chebyshevPoly(chebCoefficients, x_vals);

% Plot the original function and the Chebyshev approximation
figure;
plot(x_vals, f(x_vals), 'DisplayName', 'Original Function');
hold on;
plot(x_vals, approximated_values, 'r--', 'DisplayName', 'Chebyshev Approximation');
scatter(chebNodes, f(chebNodes), 'k', 'filled', 'DisplayName', 'Chebyshev Nodes');
legend('Location', 'Best');
title('Chebyshev Economization');

% Chebyshev Economization Function
function coefficients = chebyshevEconomization(f, degree, nodes)
    coefficients = zeros(1, degree+1);

    for k = 0:degree
        % Compute the Chebyshev coefficients using the given nodes
        coefficients(k+1) = 2/(degree+1) * sum(f(cos((2*k+1)*pi/(2*degree))) * cos((2*(0:degree)*k*pi)/(2*degree)));
    end
end

% Chebyshev Polynomial Evaluation Function
function values = chebyshevPoly(coefficients, x)
    n = length(coefficients) - 1;
    values = zeros(size(x));

    for k = n:-1:0
        values = values.*x + coefficients(n-k+1) * T_k(k, x);
    end
end

% Chebyshev Polynomial Function
function Tk = T_k(k, x)
    if k == 0
        Tk = ones(size(x));
    elseif k == 1
        Tk = x;
    else
        Tk = 2 * x .* T_k(k-1, x) - T_k(k-2, x);
    end
end
