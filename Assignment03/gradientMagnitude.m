function [gradientMagnitudeImage, Ix, Iy] =  gradientMagnitude(grayScaleImage)
    
    % define constants
    sigma = 0.5; % standard deviation
    wmin = 0.004; % minimum cornerness
    qmin = 0.5; % mimimum roundness
 
    % mask radius
    r = round(3*sigma); 
    i = -r:r;
  
    %1D-Gaussian derivation
    g = exp(-i.^2 / (2*sigma^2)) / (sqrt(2*pi)*sigma);
  
    %1D-Gaussian derivative
    d = -i.*g / sigma^2;
  
    %separated GoG convolution
    %gray value gradient in x and y
    Ix = conv2(conv2(grayScaleImage, g', 'same'), d, 'same')
    Iy = conv2(conv2(grayScaleImage, g, 'same'), d, 'same')
 
    gradientMagnitudeImage = sqrt(Ix.^2 + Iy.^2); % gradient magnitude
    figure; subplot(1, 2, 1); imshow(gradientMagnitudeImage, []); title('Gradient magnitude');

end