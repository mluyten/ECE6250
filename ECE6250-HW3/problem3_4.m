% part a
N = 25;

phi = @(z) exp(-z.^2);
t = linspace(0, 1, 1000);
figure(1); clf
hold on
for kk = 1:N
    plot(t, phi(N*t - kk + 1/2));
end
hold off