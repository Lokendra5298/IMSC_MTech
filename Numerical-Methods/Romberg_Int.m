% This program asks the user for the data necessary for a numerical integration
 
%Clear all
clc %Clean command window
clear all   %Clears or removes variables from main memory
close all   %Close all graphics windows

%Ask the user for the expression of the function
expression = input ('Enter the expression of the function:', 's'); %Read from keyboard converting to string

%Ask the user for the values of a, b and m
a = input ('Enter the value of the lower limit a: ');
b = input ('Enter the value of the upper limit b: ');
m = input ('Enter the number of intervals m: ');

%Calculate the integral
disp (' Romberg method ')
integralValue = IntegrationRomberg (expression, a, b, m);
%Show result on screen
fprintf ('\n The integral of %s evaluated from %7.2f to %7.2f is: %7.5f \n\n', expression, a, b, integralValue')
