function Assignment1
    pkg load image;

    loaded_image    = load_image('input_sat_image.jpg');
    %enhanced_image  = enhance_contrast(loaded_image);
    %save_jpg_image(enhanced_image, "enhanced_image");
    
    enhanced_image = imread('enhanced_image.jpg');
    bw_image = threshold(enhanced_image);
    
end

% loads and converts the image to a grayscaled image (?)
function [image] = load_image (filename)

##    convert color image to gray scale image
    OriginImage = imread(filename);
    
    image = uint8(mean(rgb2gray(OriginImage), 3));
    
    
    
##    image = imread('input_sat_image.jpg');
    #figure(1), imshow(image);
    %figure(2), imhist(image);
    #{
    Shortly describe the characteristics of the histogram: 
    Histogram is a graph showing the number of pixels in an image(y axis) at each different intensity value(x axis) found in that image.
    #}
    
    %enhance_contrast(image)
    #{
    Shortly describe the differences to the initial histogram:
    The figure 1 shows a low-contrast image as the the values of x axis in intensity hitogram are only distrbuted in a certain range. To improve the visual quality of the image, One technique of image enhancement is contrast stretching on histogram where the image has to use the full intensity range to display the maximum contrast. Contrast stretching takes an image in which the intensity values span the full intensity range as the figure 3 and 4 shown. 
    #}
    

end

function [new_image] = enhance_contrast(image)
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
    %figure(3), imshow(new_image);
    %figure(4), imhist(new_image);
   
    
end

% Convert the enhanced image to a binary mask, 
% 0 = background
% 1 = region of interest
% loading im2bw, graytresh
function [new_image] = threshold(image)
    %function for threshold
    %figure(1), imshow(image);
    % the resulting treshold by graytresh is 0.4353
    % Treshold 30 = There is a highlighted spot in the bottom center of the image,
    % With this spot is so bright, that if the treshold is to high, the rest of the city
    % is also in the region of interest (ROI). When the treshold is to low, not the whole river
    % is in the ROI.
    bw = im2bw(image, graytresh(image));

end

function morph_filter
    %function for mophology filter
end

% saves the image to a jpg. Only the filename is needed.
function save_jpg_image(image, filename)
    file = strcat(filename, '.jpg');
    imwrite(image, file, 'jpg');
 end