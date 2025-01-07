load imagedeconv_data

A = @(z) reshape(imconv(reshape(z,N,N), W), (N+K-1)^2, 1);
At = @(z) reshape(imconv_transpose(reshape(z, N+K-1, N+K-1), W), N^2, 1);
AtA = @(z) At(A(z));

y = reshape(Y, (N+K-1)^2, 1);

