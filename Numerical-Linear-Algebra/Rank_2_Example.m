clear all;
clc;
m = 2000;
n = 1000;
x = 2*rand(n,1)-1;
y = 3+2*rand(m,1);
for i=1:m
    for j=1:n
%       K(i,j) = cos(y(i)-x(j));
    K(i,j) = 1/(y(i)-x(j));
    end
end
rank(K)
[U,S,V]=svd(K);
