Q=[1/2 sqrt(3)/2 1/sqrt(3);
   -sqrt(3)/2 1/2 1/sqrt(3);
   0 0 1/sqrt(3);];
%[U,S,V] = svd(Q)
R=[1/2 1/sqrt(3);
   -sqrt(3)/2 1/sqrt(3);];
%[U,S,V] = svd(R)

%B=[1 2 3 4 5; 5 4 3 2 1; 1 2 3 4 5; 5 4 3 2 1; 1 2 3 4 5];
A=[1 0 1 0 0;
   0 1 0 1 0;
   1 0 0 0 1;
   1 1 0 1 1;
   1 1 1 1 0;
   1 2 3 4 5;
   5 4 3 2 1];
rank(A)
[U,S,V] = svd(A);
% Specify the value of n
n = rank(A);

% Truncate matrices U, S, V to the first n columns
U_trunc = U(:, 1:n);
S_trunc = S(1:n, 1:n);
V_trunc = V(:, 1:n);

% Compute the sum \sum_{k=1}^n \sigma_k v_k u_k^T
A1 = zeros(size(U_trunc'));
for k = 1:rank(A)
    A1 = A1 + S_trunc(k, k) * V_trunc(:, k) * U_trunc(:, k)';
end
% Display the result
disp(A1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Given data
R_tilde(:, 1) = [1; -8; 6; 1];
i_1 = 1;
i_2 = 3;

% Find the 3rd row index i_3
exclude_indices = [i_1, i_2];
i_3_candidates = setdiff(1:size(R_tilde, 1), exclude_indices);

[~, i_3_index] = max(abs(R_tilde(i_3_candidates, 1)));

i_3 = i_3_candidates(i_3_index);

% Display the result
disp('3rd row index i_3:');
disp(i_3);