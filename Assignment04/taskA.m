function [origin_img, noise_img, denoise_img] = taskA(filePathString)
    
    % task a
    % Read the input image taskA.png and convert it to a grayscale image (double values between 0.0 and 1.0)
    I = double(imread(filePathString)) / 255;
    gray_img = rgb2gray(I);
    origin_img = gray_img;
   
    % task b
    M = 0;
    V = 0.01;
    noise_img = imnoise(gray_img, 'gaussian', M, V);
    whos noise_img
    figure; subplot(1, 5, 1); imshow(noise_img); title('Noised Image');
    
    % task d: logarithmic centered image spectra of the noisy image
    FT = fft2(noise_img);
    FT_Centred = fftshift(FT);
    
    subplot(1, 5, 2); imagesc(log(abs( FT_Centred)), []); title('Centred spectra of noisy image');

    % task c
    % gaussian filter
    sigma = 3.0; %standard deviation
    
    gaussianFilter = gaussgradient2D(sigma);
    
    % compute filtering kernel with same size as image
    % with 2D gaussian filter and zero padding arround
    [h, w] = size(noise_img);
    [gh, gw] = size(gaussianFilter);

    gFilter_pad = zeros(h, w);
    gFilter_pad(1:gh, 1:gw) = gaussianFilter;
    gFilter_pad = circshift(gFilter_pad, round([-gh/2, -gw/2]));
    
    % FFT filter

    gFilter_pad_fft = fft2(gFilter_pad);

    % multiply element-wise in the frequency domain
    fil_fft = FT .* gFilter_pad_fft;
    % apply inverse FFT
    fil = ifft2(fil_fft);
    denoise_img = fil;
    
    subplot(1,5,3), imagesc(log(abs(fftshift(gFilter_pad_fft)))); title('logarithmic centered image spectrath of (padded) Gaussianfilter');
    subplot(1,5,4), imagesc(log(abs(fftshift(fil_fft)))); title('logarithmic centered image spectra of filtered image')
    subplot(1,5,5), imshow(fil, []); title('Filtered image after inverse FFT');
   
end

function [gaussianFilter] = gaussgradient2D(sigma)
  size = round(3 * sigma);
  g = zeros(size,size);
  r = (size-1)/2;
  for i = -r:r
      for j = -r:r
          % centering
          x0 = (size+1)/2;
          y0 = (size+1)/2;
          row = i+x0;
          col = j+y0;
          g(col,row) = exp(-((row-x0)^2+(col-y0)^2)/2/sigma/sigma);
      end
  end
  % normalize filter
  gaussianFilter = g/sum(sum(g));
end

