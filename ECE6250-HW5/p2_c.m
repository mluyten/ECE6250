img = double(imread("frog.tiff")) - 128;

error = zeros(1,63);

for m = 1:63
    img_approx = block_dct2_approx(img, m);
    error(m) = log10(norm(img-img_approx, 'fro')^2/norm(img, 'fro')^2);
end

figure(1);
plot(error); hold on;
xlabel("M");
ylabel("Relative Error (dB)")



figure(2);
imagesc(block_dct2_approx(img, 1));
title("M = 1");
figure(3);
imagesc(block_dct2_approx(img, 3));
title("M = 3");
figure(4);
imagesc(block_dct2_approx(img, 8));
title("M = 8");
figure(5);
imagesc(img); 
title("Original Image");
hold off;