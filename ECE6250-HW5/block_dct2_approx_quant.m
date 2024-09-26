function [IM_C, COEFF] = block_dct2_approx_quant(IM)
    N = 8;    
    coeffs = block_dct2(IM, N);
    dim = size(coeffs);
    [z, pairs, map] = jpgzzind(dim(1), dim(2));
    load("jpeg_Qtable.mat");
    COEFF = zeros(dim(1), dim(2));
    rows = dim(1) / N;
    cols = dim(2) / N;

    for i = 1:rows
        for j = 1:cols
            COEFF((i-1)*N+1:i*N, (j-1)*N+1:j*N) = Q.*round(coeffs((i-1)*N+1:i*N, (j-1)*N+1:j*N)./Q);
        end
    end

    IM_C = block_idct2(COEFF, N);
end
