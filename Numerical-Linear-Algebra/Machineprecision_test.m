%To provr that machine precision is 2^-52
clear all
clc;
epsilon=1;
while(1+epsilon > 1)
    epsilon=epsilon/2;
end
epsilon*2^53
