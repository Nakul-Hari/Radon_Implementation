phantom_size = 128;
I = phantom(phantom_size,phantom_size);
I = double(I);
I1 = zeros(256,256);
I1(64+(1:128),64 +(1:128)) = I;

imagesc(I);
colormap(gca, 'gray');

numAngles = 179;
N = size(I, 1);

Xc = phantom_size / 2;
Yc = phantom_size / 2;

R = zeros(2 * phantom_size, numAngles); % Radon transform using revolving ray

for t = 0:numAngles
    angle = deg2rad(-t); % Negative due to MATLAB's coordinate system

    for rho = 1:2*phantom_size
        ray = 1:2*phantom_size;
        
        % Calculate rotated coordinates
        x_rotated = (rho - phantom_size) * cos(angle) - (ray - phantom_size) * sin(angle) + Xc;
        y_rotated = (rho - phantom_size) * sin(angle) + (ray - phantom_size) * cos(angle) + Yc;

        % Interpolate using interp2
        intensity = interp2(I, x_rotated, y_rotated, 'linear');
        intensity(isnan(intensity)) = 0; % Replace NaN values with 0
        R(rho, t+1) = sum(intensity); % Assign intensity to R
    end
end

theta = 90:269;
sinogram = zeros(size(I1, 1), length(theta));

for t = 1:length(theta)
    rotated_image = imrotate(I1, -theta(t), 'bilinear', 'crop');
    sinogram(:, t) = sum(rotated_image, 2);
end

figure;
subplot(1, 3, 1);
imagesc(R);
title('Radon Transform');
xlabel('Angle (degrees)');
ylabel('Projection Position');
colormap(gca, 'gray');
colorbar;
axis image;

% Display the sinogram
subplot(1, 3, 2);
imagesc(sinogram);
title('Radon Transform');
xlabel('Angle (degrees)');
ylabel('Projection Position');
colormap(gca, 'gray');
colorbar;
axis image;

% Display the reconstructed image
subplot(1, 3, 3);
imagesc(sinogram-R);
xlabel('X');
ylabel('Y');
title('Reconstructed Image');
colormap(gca, 'gray');
colorbar;
axis image;