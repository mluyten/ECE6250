function IM = block_idct2(XB, N)
    dim = size(XB);
    IM = zeros(dim(1), dim(2));
    for i = 1:dim(1) / N
        for j = 1:dim(2) / N
            IM((i-1)*N+1:i*N, (j-1)*N+1:j*N) = idct2(XB((i-1)*N+1:i*N, (j-1)*N+1:j*N));
        end
    end
end