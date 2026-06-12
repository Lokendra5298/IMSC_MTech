% Function for QR decomposition
function [Q,R] = myqr(A)
    [m,n]   =   size(A);
    Q = zeros(m,n); % Initialization of matrix Q
    R = zeros(n,n); % Initialization of matrix R
    for j=1:n
        Q(:,j)  =   A(:,j); 
        for i=1:j-1
            R(i,j) = Q(:,i)'*A(:,j); % Length of projection
            Q(:,j) = Q(:,j)-R(i,j)*Q(:,i); 
        end
        R(j,j)  =   norm(Q(:,j)); 
        Q(:,j)  =   Q(:,j)/R(j,j);
    end
end