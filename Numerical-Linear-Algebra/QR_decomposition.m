clear all
clc
n=4;
A= rand (4,4);
[Q,R]=qr(A) % Matlab Inbuilt QR
[Q1,R1]=myqr(A) % QR Using Gram_Schmidt
[Q2,R2] = mymodifiedqr(A) % Modified QR
[Q3,R3] = householderQR(A) % House-Holder QR