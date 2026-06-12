m = 80;
n = 30;
z = randn(m, n);

% Initialization
i = 1;
j = 0;

ik = 2:m;
jk = 1:n;

r=min(m,n);
u = zeros(m, r);
v = zeros(r, n);
rt = zeros(m, n);
znorm = 0;

for k = 1:r
    % Step 1
    rt(i, :) = z(i, :);
    for l = 1:k-1
        rt(i, :) = rt(i, :) - u(i, l) * v(l, :);
    end
    
    

    % Step 2
    [~, j] = max(abs(rt(i, jk)));
    j = jk(j);
    remove = find(jk == j);  
    jk(remove) = [];
    

    % Step 3
    v(k, :) = rt(i, :);
    v(k, j) = v(k, j) / rt(i, j);

    % Step 4
    rt(:, j) = z(:, j);
    for l = 1:k-1
        rt(:, j) = rt(:, j) - v(l, j) * u(:, l);
    end
   

    % Step 5
    u(:, k) = rt(:, j);

    % Step 6
    uv = sum(abs(u(:, k)).^2) * sum(abs(v(k, :)).^2);
    znorm = znorm.^2 + uv;  
    for l = 1:k-1
        znorm = znorm + 2 * abs(sum(u(:, k) .* u(:, l)) * sum(v(k, :) .* v(l, :)));
    end
    znorm = sqrt(znorm)

    % Step 7
    if sqrt(uv) <= 1e-3 * znorm
        rt
        break;
    end

    % Step 8
    [~, i] = max(abs(rt(ik, j)));
    i = ik(i);
    remove = find(ik == i);
    ik(remove) = [];
end

rt;
Zt = u * v;
e = Zt -z

% Display the original matrix and the reconstructed matrix
figure;

% Plot the column vectors of matrix z in blue
subplot(2, 1, 1);
hold on;
for col = 1:n
    plot(1:m, z(:, col), '-', 'LineWidth', 1.5);
end
title('Original Matrix z');
xlabel('Row Index');
ylabel('Values');
grid on;

% Plot the column vectors of matrix Zt in red
subplot(2, 1, 2);
hold on;
for col = 1:n
    plot(1:m, Zt(:, col), 's', 'LineWidth', 1.5);
end
title('Reconstructed Matrix Zt');
xlabel('Row Index');
ylabel('Values');
grid on;

