% We are adding delta, 2^30 times
clear all;
clc;
N = 2^(30); % Total addition
a = 1;
delta = 2^(-55);
for k=1:N
    a = a+delta; % Calculation in computer
end
a
b = 1+(N*delta) % Calculation by hand
b-a