function [V,R] = householderQR(A)
    [m,n] = size(A);
    for k=1:n
        x = A(k:m,k);
        x(1) = x(1)+sign(x(1))*norm(x);
        x = x/norm(x);
        V(k:m,k) = x;
        A(k:m,k:n) = A(k:m,k:n)-2*x*(x'*A(k:m,k:n));
    end
    R = A(1:n,1:n);
end