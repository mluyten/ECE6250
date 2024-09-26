% part b
N = 4;
a = [1 -1 1 -1];
t = linspace(0,1,1000);
y = zeros(size(t));
for jj = 1:N
    y = y + a(jj)*phi(N*t - jj + 1/2);
end
plot(t, y)