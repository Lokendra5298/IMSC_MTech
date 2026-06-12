clc
clear all
% Given matrix U
U = [1/sqrt(2), 1/sqrt(6), 1/sqrt(3);
     1/sqrt(2), -1/sqrt(6), -1/sqrt(3);
     0, 2/sqrt(6), -1/sqrt(3);
    -1/sqrt(2), 1/sqrt(6), -1/sqrt(3);
     0, 0, 2/sqrt(3)];

% Transpose matrix U to get U^T
U_T = U';

% Create matrix A with three rows from U^T and two zero rows
A = [U_T(1:3, :); zeros(2, size(U_T, 2))];

% Display matrix A
disp('Matrix A:');
disp(A);
