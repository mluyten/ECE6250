x = randn(100000,1);
d1 = mydct(x);
d2 = dct(x);
norm(d1-d2)

y = randn(100000,1);
w1 = myidct(y);
w2 = idct(y);
norm(w1-w2)