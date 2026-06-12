% This is the counter example wher my qr by Gram_Schmidt failed
clear all;
clc;
n = 3;
epsilon = 2^(-30);
% A = rand(3,3);
A = [1 1 1;
    epsilon epsilon 0;
    epsilon 0 epsilon]
[Qmgs,Rmgs] = mymodifiedqr(A);
[Qcgs,Rcgs] = myqr(A);
[Q,R]       = qr(A);
Qcgs*Rcgs-A
Rcgs
Qcgs'*Qcgs

Qmgs*Rmgs-A
Rmgs
Qmgs'*Qmgs

Q*R-A
R
Q'*Q
% [Qm,Rm] = qr(A);
% Qm*Rm-A
% Rm
% Qm'*Qm