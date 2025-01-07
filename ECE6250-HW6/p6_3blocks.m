load("blocks.mat");

w_blocks = haar(c, 3);
blocks_hat = ihaar(w_blocks, 3);

% Ensure Perfect Reconstruction
err = norm(blocks - blocks_hat)^2

% Ensure Energy is Conserved
signal_energy = norm(blocks)^2
transform_energy = norm(w_blocks)^2

h = ones(2,1);
w_9 = upsample(w_blocks(1:512), 2);
w_9 = conv(h.', w_9);

h = ones(4,1);
w_8 = upsample(w_blocks(513:768), 4);
w_8 = conv(h.', w_8);

h = ones(8,1);
w_7 = upsample(w_blocks(769:896), 8);
w_7 = conv(h.', w_7);
s_7 = upsample(w_blocks(897:end), 8);
s_7 = conv(h.', s_7);

plot(w_9(1:end-1)); hold on
plot(w_8(1:end-3));
plot(w_7(1:end-7));
plot(s_7(1:end-7)); 
legend({'W_9', 'W_8', 'W_7', 'S_7'}); 
title("Blocks Scaling and Wavelet Coefficients at L=3"); hold off