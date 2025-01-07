function y = svd_trunc(x, r)
    [U, S, V] = svd(x);
    y = U(:,1:r)*S(1:r,1:r)*V(:,1:r).';
end

