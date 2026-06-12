% Define the function f and its derivative f'
f = @(x) sin(x);
fprime = @(x) cos(x);

% Define the domain and the step size
a = 0; % lower bound
b = 2*pi; % upper bound
n = 100; % number of points
h = (b-a)/n; % step size
x = a:h:b; % x values

% Initialize the matrix for storing the approximations
R = zeros(n+1,n+1);

% Loop over the interior points and use the three-point central difference formula with error O(h^2)
for i = 2:n
    R(i,1) = (f(x(i+1)) - f(x(i-1))) / (2*h);
end

% Apply Richardson extrapolation to improve the accuracy to O(h^4)
%for j = 2:3
%    for i = j:n-j+1
%        R(i,j) = (2^(j-1)*R(i,j-1) - R(i-1,j-1)) / (2^(j-1) - 1);
%    end
%end

% Apply Richardson extrapolation to improve the accuracy to O(h^8)
for j = 2:5
    for i = j:n-j+1
        R(i,j) = (4^(j-1)*R(i,j-1) - R(i-1,j-1)) / (4^(j-1) - 1);
    end
end
% Plot the approximations and the true derivative
% plot(x,R(:,3),'r') 
plot(x,R(:,5),'r')
hold on
plot(x,fprime(x),'b')
legend('Approximation','True derivative')
