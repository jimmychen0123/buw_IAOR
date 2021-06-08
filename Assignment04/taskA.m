function [noise_img] = taskA(filePathString)
    
    % task a
    % Read the input image taskA.png and convert it to a grayscale image (double values between 0.0 and 1.0)
    I = double(imread(filePathString)) / 255;
    gray_img = rgb2gray(I);
   
    % task b
    M = 0;
    V = 0.01;
    noise_img = imnoise(gray_img, 'gaussian', M, V)
    whos noise_img
    figure; subplot(1, 5, 1); imshow(noise_img); title('Noised Image');
    
    % task d: logarithmic centered image spectra of the noisy image
    FT = fft2(noise_img);
    FT_Centred = fftshift(FT);
    
    subplot(1, 5, 2); imagesc(log(1 + abs( FT_Centred)), []); title('Centred spectra of noisy image');

    % task c
    
    % gaussian filter
    sigma = 1.0; %standard deviation
    
%    sz = 250; %window size
    [xd , yd] = size(noise_img);
    X = -xd./2 : xd./2-1;
    Y = -yd./2 : yd./2-1;
%    ind = -floor(sz/2) : floor(sz/2); 
%    [x, y] = meshgrid(ind, ind);
    [x, y] = meshgrid(X, Y);
    
%    M = size(x,1) - 1;
%    N = size(y,1) - 1;
    
    Exp_comp = -(x.^2+y.^2)/(2*sigma*sigma);
    Kernel= exp(Exp_comp)/(2*pi*sigma*sigma);
    Kernel = Kernel / sum(Kernel(:));
 
    
    subplot(1, 5, 3); imshow( Kernel, []); title('Gaussian filter');
    
    imFilter = abs(ifft2(FT_Centred.*Kernel));
    
    subplot(1, 5, 4); imshow( imFilter, []); title('Denoised image');
    
    
     
    
    %Initialize
%    Output=zeros(size(noise_img));
    %Pad the vector with zeros
%    noise_img = padarray(noise_img,[sz sz]);

%    %Convolution
%    for i = 1:size(noise_img,1)-M
%        for j =1:size(noise_img,2)-N
%            Temp = noise_img(i:i+M,j:j+M).*Kernel;
%            Output(i,j)=sum(Temp(:));
%        end
%    end
    %Image without Noise after Gaussian blur
    
%    figure,imshow(Output);
    
    
    
%    g = fspecial('gaussian', size(noise_img), 10);
    
    
    %FFT:
    % F(u,v) = 1/M*N SUM(0,M-1)SUM(0,N-1) f(x,y)*e^(j*2*pi*(u*x/M + l*y/N))
    % for every u, v
    
    % scalar = magnitude -> abs(comlex_value)
    
    %centering
    
    %log
    
    %apply Gauss2D Filter
    
    

end

function gauss2dFilter(noise_img)
    term_1 = (x./2*pi*sigma^2);
    term_2 = -(x.^2 + y.^2) / 2*sigma^2;
    gauss2D = term_1.*exp( term_2 );
    
    % add padding
    
    
end

function ifft2(noise_img)

end

