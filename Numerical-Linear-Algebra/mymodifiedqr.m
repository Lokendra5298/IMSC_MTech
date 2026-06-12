function [Q,R] = mymodifiedqr(A)
    [m,n]   =   size(A);
    Q = A;
    R = zeros(n,n);
    for j=1:n
        R(j,j)  =   norm(Q(:,j));
        Q(:,j)  =   Q(:,j)/R(j,j);
        for i=j+1:n
            R(j,i) = Q(:,i)'*Q(:,j);
            Q(:,i) = Q(:,i)-R(j,i)*Q(:,j);
        end
    end
end