function [noise_img] = taskA(gray_image)
    
    noise_img = imnoise(gray_image, 'gaussian', 0, 0.01);
    figure('name', 'Task A: Imnoise image'), imshow(noise_img);
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

