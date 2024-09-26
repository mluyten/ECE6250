img = double(imread("frog.tiff")) - 128;

[img_approx, coeffs] = block_dct2_approx_quant(img);

error = log10(norm(img-img_approx, 'fro')^2/norm(img, 'fro')^2);
n = nnz(coeffs);
error1 = norm(coeffs-block_dct2(img, 8), 'fro');
error2 = norm(img_approx-img, 'fro');
fprintf("Number of Non-Zero Coefficients = %d\n", n);
fprintf("|a_approx - a| = %d\n", error1);
fprintf("|x_approx - x| = %d\n", error2);
fprintf("Relative Error (dB) = %d\n", error);


figure(1);
imagesc(img_approx);
title("Approximation w/ Quantized Coefficients");
figure(2);
imagesc(img); 
title("Original Image");
hold off;