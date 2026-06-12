% Padé approximation (a rational function)
syms x % define symbolic variable
f = log(1+x); % define function
p = pade(f,x,0,'Order',[1 3]); % find Padé approximation
p = simplify(p); % simplify the result
disp(p);

fplot(f,[-5 5]) % plot function
hold on
fplot(p,[-5 5]) % plot approximation
hold off
legend('f(x)','p(x)') % add legend