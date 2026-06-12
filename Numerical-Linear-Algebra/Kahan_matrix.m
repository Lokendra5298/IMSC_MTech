% Kahan Matrix which is counter example for PPLU(Partial pivoting) Method
clear all;
clc;
n=6;
x=ones(n,1);
A = kahan(n)
b=A*x
y=A\b
Forward_Err = norm(y-x)/norm(x)
Backward_Err = norm(A*y-x)/norm(b)

% To get a tri_diagonal Lower triangular matrix which has high condition no.
n = 9;
A = eye(n) - 10*diag(ones(n-1,1),-1) + 9*diag(ones(n-2,1),-2);
cond(A);
