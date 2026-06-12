clear all
clc;
n=20;
a(1)=2.95;
a(2)=2.95;
for k=2 :n
     a(k+1)=10*a(k)-9*a(k-1); %Ill_conditioned problem
%    a(k+1)=0.75*a(k)+0.25*a(k-1); %Well_conditioned problem

end
a