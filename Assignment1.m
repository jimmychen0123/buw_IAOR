function Assignment1
    load_image()
    
end

function load_image

    image = imread('input_sat_image.jpg');
    figure(1), imshow(image);
    figure(2), imhist(image);
    
    enhance_contrast(image)
    

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
