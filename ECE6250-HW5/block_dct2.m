function XB = block_dct2(IM, N)
    dim = size(IM);
    XB = zeros(dim(1), dim(2));
    for i = 1:dim(1) / N
        for j = 1:dim(2) / N
            XB((i-1)*N+1:i*N, (j-1)*N+1:j*N) = dct2(IM((i-1)*N+1:i*N, (j-1)*8+1:j*N));
        end
    end
end