function [enhancedImage] = enhanceContrastV (grayImage)
  
  %Image enhancement
  % 
  
  % get min, max
    max_value = max(grayImage(:));
    min_value = min(grayImage(:));
    enhancedImage = zeros(size(grayImage,1),size(grayImage,2));
    clear enhancedImage;
    range = max_value-min_value;
    
    %for every pixel in the image
    %for i = 1:size(grayImage,1)
    %    for j = 1:size(grayImage,2)
            %calculate the contrast enhancement 
            % I[r,c] = I[r,c]-min/max-min
            %contrast = double(grayImage(i,j) - min_value)/double(range);
            %enhancedImage(i,j) = uint8(contrast*255);
    %    end
    %end
    
    contrast = double(grayImage - min_value)/double(range);
    enhancedImage = uint8(contrast*255); 
  #{
    Shortly describe the differences to the initial histogram:
    The figure 1 shows a low-contrast image as the the values of x axis in intensity hitogram are only distrbuted in a certain range. To improve the visual quality of the image, One technique of image enhancement is contrast stretching on histogram where the image has to use the full intensity range to display the maximum contrast. Contrast stretching takes an image in which the intensity values span the full intensity range as the figure 3 and 4 shown. 
  #}

endfunction
