N=50;

% Define function and basis function
x = @(z) (z<1/4).*(4*z) + (z>=1/4).*(z<1/2).*(-4*z+2) - (z>=1/2).*sin(20*pi*z);
phi = @(z) exp(-z.^2);

% Init empty Gram and b matrices
G = zeros(N,N);
b = zeros(N,1);

% Iterate over grammian and b and fill in inner products
for r = 1:N
    for c = 1:N
        % Calc <v_c,v_r>
        f = @(t) phi(N*t - c + 1/2).*phi(N*t - r + 1/2);
        G(r, c) = integral(f, 0, Inf);
    end
    % Calc <x,v_r>
    f = @(t) x(t).*phi(N*t - r + 1/2);
    b(r,1) = integral(f, 0, 1);
end

% Calculate coefficients a = G^(-1)b
a = G\b;

% Create t, x(t), and y(t) and 
t = linspace(0,1,1000);
x = x(t);
y = zeros(size(t));

for jj = 1:N
    y = y + a(jj)*phi(N*t - jj + 1/2);
end

% Plot 'em
figure(1);
plot(t,x); hold on
plot(t,y); hold off
legend('$$x(t)$$', '$$y(t)$$', 'Interpreter', 'Latex');