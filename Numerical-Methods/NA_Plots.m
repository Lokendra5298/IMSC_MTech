%% A function with wiggles
x = linspace(0, 1, 1000); % Define a range for x, e.g., from 0 to 2*pi
f = sin(6*x) + sin(60*exp(x));
clf; % Clear the current figure
plot(x, f);
title('A function with wiggles', 'FontSize', 9);

%% A function with two spikes
x = linspace(-1, 1, 1000); % Define a range for x, e.g., from 0 to 2*pi
f = 1./(1+1000*(x+.5).^2) + 1./sqrt(1+1000*(x-.5).^2);
clf; % Clear the current figure
plot(x, f);
title('A function with two spikes', 'FontSize', 9);

%% Chebyshev interpolants are effective for complex functions (still defined on a 
% real interval) as well as real ones. Here, for example, is a complex function
% that happens to be periodic, though the Chebyshev representation does not
% take advantage of this fact.
x = linspace(-1, 10, 1000);  
% Define the function 'f' using complex numbers
f = (3 + sin(10*pi*x) + sin(61*exp(.8*sin(pi*x)+.7))) .* exp(1i*pi*x);

% Create the plot with specified properties
plot(x, real(f), 'linewidth', 0.6, 'color', [0, 0.8, 0]);
axis equal off;

% You can add other plot customization as needed
title('Plot of f(x)');
xlabel('x');
ylabel('Real(f)');



