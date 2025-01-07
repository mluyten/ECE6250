% imconv_transpose.m
%
% Convolves a square image with the "flipped" version of the square kernel,
% and takes the middle part.
%
% This is the adjoint of imconv.m.
%
% Written by: Justin Romberg, Georgia Tech
% Created: 11/17/2011

function V = imconv_transpose(Y, W)

M = size(Y, 1);
K = size(W, 1);
N = M - K + 1;
Vu = ifft2(fft2(Y,N+2*K-2,N+2*K-2).*fft2(rot90(W,2) ,N+2*K-2,N+2*K-2));
V = Vu(K:N+K-1,K:N+K-1);

