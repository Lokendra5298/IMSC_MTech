%Suppose we want to interpolate some smooth data

range(6), 
x = (4*pi)*[0 1 rand(1,15)]; 
y = sin(x);
%You can use the cubic spline interpolant obtained by

cs = csapi(x,y);
% plot the spline, along with the data, with the following code

fnplt(cs);
hold on
plot(x,y,'o')
legend('cubic spline','data')
hold off