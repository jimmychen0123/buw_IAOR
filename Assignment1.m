function Assignment1
    load_image()
    
end

function load_image

##    convert color image to gray scale image
    OriginImage = imread('input_sat_image.jpg');
    
    image = uint8(mean(rgb2gray(OriginImage), 3));
    
    
    
##    image = imread('input_sat_image.jpg');
    figure(1), imshow(image);
    figure(2), imhist(image);
    #{
    Shortly describe the characteristics of the histogram: 
    Histogram is a graph showing the number of pixels in an image(y axis) at each different intensity value(x axis) found in that image.
    #}
    
    enhance_contrast(image)
    #{
    Shortly describe the differences to the initial histogram:
    The figure 1 shows a low-contrast image as the the values of x axis in intensity hitogram are only distrbuted in a certain range. To improve the visual quality of the image, One technique of image enhancement is contrast stretching on histogram where the image has to use the full intensity range to display the maximum contrast. Contrast stretching takes an image in which the intensity values span the full intensity range as the figure 3 and 4 shown. 
    #}
    
    

end

function enhance_contrast(image)
    % get min, max
    max_value = max(image(:))
    min_value = min(image(:))
    new_image = zeros(size(image,1),size(image,2));
    clear new_image;
    range = max_value-min_value
    
    %for every pixel in the image
    for i = 1:size(image,1)
        for j = 1:size(image,2)
            %calculate the contrast enhancement 
            % I[r,c] = I[r,c]-min/max-min
            contrast = double(image(i,j) - min_value)/double(range);
            new_image(i,j) = uint8(contrast*255);
        end
    end
    figure(3), imshow(new_image);
    figure(4), imhist(new_image);
    
    
end

function threshold
    %function for threshold
end

function morph_filter
    %function for mophology filter
end
