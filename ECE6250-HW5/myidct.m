function X = myidct(Y)
    Y_s = Y.*sqrt(length(Y)*2);
    Y_s(1) = Y_s(1)*sqrt(2);
    odd_ext = [Y_s; 0; -flip(Y_s)];
    coeffs = [odd_ext(1:end-1); -odd_ext(1:end-1)];
    X = ifft(coeffs);
    X = downsample(X(1:2*length(Y)),2,1);
end

% PSEUDO-CODE
% Given DCT coefficients Y with N elements
% Scale coeffs where k != 0 by sqrt((4*N)/2))
% Scale coeff where k = 0 by sqrt(4*N)
% Flip and tile coefficients so they match fft
%   - If Y = [a b c], then the fft coeffs [a b c 0 -c -b -a -b -c 0 c b]
% Take the inverse FFT of the tiled and flipped coeffs
% Take the first N*2 elements of X and downsample by 2
%   - ifft(coeffs) = [0 a 0 b 0 c 0 d], so X = [a b c d]