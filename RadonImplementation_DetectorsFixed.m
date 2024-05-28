
phantom_size = 128;
I = phantom(phantom_size,phantom_size);
I = double(I);

theta = 90:269;
sinogram = zeros(size(I, 1), length(theta));

for t = 1:length(theta)
    rotated_image = imrotate(I, -theta(t), 'bilinear', 'crop');
    sinogram(:, t) = sum(rotated_image, 2);
end

% Display the sinogram
imshow(sinogram, [], 'XData', theta, 'YData', linspace(0, phantom_size, phantom_size));
title('Radon Transform');
xlabel('Angle (degrees)');
ylabel('Projection Position');
colormap(gca, 'gray');
colorbar;

reconstructed_image = iradon(sinogram, theta, 'linear', 'Ram-Lak', size(I, 1));

% Display the reconstructed image
figure;
imshow(imrotate(reconstructed_image,-90,'bilinear','crop'), []);
xlabel('X');
ylabel('Y');
title('Reconstructed Image from Sinogram');