% Define the interval
a = -1;
b = 1;

% Define the weight function
w = @(x) 1./sqrt(1-x.^2);

% Define the degree of the polynomial
n = 5;

% Generate the monic orthogonal polynomials
p = cell(n+1,1);
p{1} = @(x) 1;
p{2} = @(x) x;
for k = 2:n
    p{k+1} = @(x) (x.*p{k}(x) - p{k-1}(x))./(k);
end

% Generate the Vandermonde matrix
V = zeros(n+1,n+1);
for i = 1:n+1
    for j = 1:n+1
        V(i,j) = quadgk(@(x) w(x).*p{i}(x).*p{j}(x), a, b);
    end
end

% Generate the right-hand side vector
bVec = zeros(n+1,1);
for i = 1:n+1
    bVec(i) = quadgk(@(x) w(x).*x.^i, a, b);
end

% Solve the linear system
c = V\bVec;

% Define the approximation
f = @(x) 0;
for i = 1:n+1
    f = @(x) f(x) + c(i)*p{i}(x);
end

% Plot the approximation
xVals = linspace(a, b, 1000);
yVals = arrayfun(f, xVals);
plot(xVals, yVals);
