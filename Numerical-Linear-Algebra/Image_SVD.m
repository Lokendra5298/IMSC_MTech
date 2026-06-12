A = imread('street1.jpg');

K = rgb2gray(A);
%imshow(A)
imshow(K)
[U,S,V] = svd(double(K));
size(K)
r = 50;
Knew = U(:,1:r)*S(1:r,1:r)*V(:,1:r)';
imshow(uint8(Knew))
format longG
diag(S)
diag(S(1:r,1:r))
