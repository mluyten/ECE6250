function Y = mydct(X)
    up_sym_ex = upsample([X; flip(X)], 2, 1);
    coeffs = real(fft(up_sym_ex));
    Y = coeffs(1:length(X)).*sqrt(1/(2*length(X)));
    Y(1) = Y(1)*sqrt(1/2);
end

% PSEUDO-CODE
% Given signal X with N elements
% Create symmetric extension of X
%   - If X = [a b], then the symmetric extension is [a b b a]
% Upsample symmetric extension by two with zeros such that
% every even index = 0
%   - If X_ex = [a b b a], then the upsampled version is [0 a 0 b 0 b 0 a]
% Take FFT of upsampled symmetric extension
% Keep only first N elements of the FFT
% Multiply coeffs where k != 0 by sqrt(2/(N*4))
% Multiply coeff where k = 0 by sqrt(1/(N*4))