% imconv.m
%
% Convolves a square image with a square kernel
%
% Written by: Justin Romberg, Georgia Tech
% Created: 11/17/2011

function Y = imconv(X, W)

N = size(X, 1);
K = size(W, 1);
Y = ifft2(fft2(X,N+K-1,N+K-1).*fft2(W,N+K-1,N+K-1));

