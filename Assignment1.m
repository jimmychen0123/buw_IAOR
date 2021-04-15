function Assignment1
    load_image()
    
end

function load_image

    image = imread('input_sat_image.jpg');
    size(image)
    figure(1), imshow(image);
    figure(2), imhist(image);
    
    enhance_contrast(image)
    

end

function enhance_contrast(image)
    % get min, max
    % I[r,c] = I[r,c]-min/max-min
end

function threshold
    mean
end

function morph_filter

end
