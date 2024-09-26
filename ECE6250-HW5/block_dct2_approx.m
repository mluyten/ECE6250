function IM_C = block_dct2_approx(IM, M)
    N = 8;
    coeffs = block_dct2(IM, N);
    dim = size(coeffs);
    [z, pairs, map] = jpgzzind(N, N);
    mask = map <= M;
    for i = 1:dim(1) / N
        for j = 1:dim(2) / N
            coeffs((i-1)*N+1:i*N, (j-1)*N+1:j*N) = coeffs((i-1)*N+1:i*N, (j-1)*N+1:j*N).*mask;
        end
    end

    IM_C = block_idct2(coeffs, N);
end