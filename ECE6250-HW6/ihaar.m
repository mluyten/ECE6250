function x = ihaar(w, L)
    sz = length(w);
    g0 = [1/sqrt(2); 1/sqrt(2)];
    g1 = [1/sqrt(2); -1/sqrt(2)];
    coef_len = (sz/2^L);
    x = w(end-coef_len+1:end);
    w = w(1:end-coef_len);
    for i = 1:L
        coef_len = (sz/2^(L-i+1));
        s = conv(upsample(x, 2), g0);
        x = s + conv(upsample(w(end-coef_len+1:end), 2), g1);
        x = x(1:end-1);
        w = w(1:end-coef_len);
    end
end