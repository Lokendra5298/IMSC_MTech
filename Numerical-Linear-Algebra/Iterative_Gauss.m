clear all;
clc;
n = 5;
A = rand(n);    % Matrix
b = rand(n,1);  % rhs
for k=1:n
    A(k,k) = sum(abs(A(k,:))); % To get strictly diagonaliy dominant matrix
end
D = diag(diag(A));
N = A-D;
epsilon = 1e-6; % Tolerance
x = rand(n,1);  % initial guess
bnorm = norm(b);
r = norm(A*x-b)/bnorm;    % residual
count = 0;
while(r>epsilon)
    x = D\(b-N*x);
    r = norm(A*x-b)/bnorm;    % residual
    count = count+1;
end
r % Error
xe = A\b % Exact solution
x % Iterative solution
count % To get number of iterations