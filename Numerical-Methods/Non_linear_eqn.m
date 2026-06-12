syms x y a;

b(1) = 100 * sin(x) - 25 * sin(a) - 175 * sin(y);
b(2) = 125 + 100 * cos(x) - 25 * cos(a) - 175 * cos(y);

% Solving the system of equations
sol = solve(b, [x, y]);

% Extracting the solutions
Xsoln = simplify(sol.x);
Ysoln = simplify(sol.y);

% Display the solutions
disp('Xsoln:');
disp(Xsoln);

disp('Ysoln:');
disp(Ysoln);
