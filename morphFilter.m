function [morphed_image] = morphFilter(image)
    %function for mophology filter
##    se = strel('disk',5,0);
    se = strel('diamond',20);
    temp_image = imopen(image, se);
    
    se = strel('diamond',8);
##    temp_image = imclose(temp_image, se);
    morphed_image = imclose(temp_image, se); 
    
    
end
