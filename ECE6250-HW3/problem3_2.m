N=2;

% Init empty Gram and b matrices
G = zeros(N,N);
b = zeros(N,1);

% Iterate over grammian and b and fill in inner products
for r = 1:N
    for c = 1:N
        % Calc <v_c,v_r>
        f = @(t) t.^(r-1).*t.^(c-1).*exp(-2.*t);
        G(r, c) = integral(f, 0, Inf);
    end
    % Calc <x,v_r>
    f = @(t) t.^(r-1).*exp(-t);
    b(r,1) = integral(f, 0, 1);
end

% Calculate coefficients a = G^(-1)b
a = G\b;

% Plot x and x_hat (our approximation)
t = linspace(0,2);
x = t <= 1;
x_hat = zeros(1, 100);

for n = 1:N
    x_hat = x_hat + a(n).*t.^(n-1).*exp(-t);
end
plot(t, x); hold on;
plot(t, x_hat); hold off;
title(['Plot of $$h(t)$$ and $$\hat{h}(t)$$, N=', num2str(N)], 'Interpreter', 'Latex');
legend('$$h(t)$$', '$$\hat{h}(t)$$', 'Interpreter', 'Latex');