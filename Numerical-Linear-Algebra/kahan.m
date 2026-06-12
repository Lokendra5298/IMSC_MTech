function A = kahan(n);
A= tril(-0.9*ones(n))+2*eye(n);
A(:,n) = 1;
end
