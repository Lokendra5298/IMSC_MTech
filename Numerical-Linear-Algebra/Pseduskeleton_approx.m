n = 5;
epsilon = (3/(n-3))^(1/3);

% Create the initial matrix U
U = [0 epsilon;
     1 epsilon;
     1 2*epsilon];

% Repeat the specified rows from the 4th row to the 100th row
U = [U; repmat([epsilon^2, -epsilon^2], n-3, 1)];

% Display the modified matrix U
disp(U);
% In U there are first 3 submatrix of order 2 whose volume is epsilon
P=[0 epsilon;
   1 epsilon];
UTilde=U*inv(P);
%Minimal singular value of U1, is greater than that of U2
U1=[0 epsilon;
     1 epsilon;];
U2=[0 epsilon;
     1 2*epsilon;];
[U S V]=svd(U1);
[U1 S1 V1]=svd(U2);
S
S1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p=10^(-10);
d1=0.2;
d2=0.1;
A1=[p epsilon*d2;
    d1 epsilon*d2];
A2=[0 epsilon*d2;
    d1 2*epsilon*d2];
%Minimal singular value of A1, is greater than that of A2
%[U S V]=svd(A1);
%[U1 S1 V1]=svd(A2);
%S
%S1

