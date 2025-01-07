function w = haar(x, L)
    h0 = [1/sqrt(2); 1/sqrt(2)];
    h1 = [-1/sqrt(2); 1/sqrt(2)];
    w = [];
    for row = 1:L
        s = downsample(conv(x, h0), 2, 1);
        w = [w; downsample(conv(x, h1), 2, 1)];
        x = s;
    end
    w = [w; s];
end