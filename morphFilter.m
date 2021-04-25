function [morphed_image] = morphFilter(image)
    %function for mophology filter
##    se = strel('disk',5,0);
    se = strel('diamond',4);
    open_image = imopen(image, se);
    close_image = imclose(image, se);
  
    open_close_image = imclose(open_image, se);
    figure('name', 'open + close image'), imshow(open_close_image);
    
    close_open_image = imopen(close_image, se);
    figure('name', 'close + open image'), imshow(close_open_image);
    
    
##    se = strel('diamond',8);
##    temp_image = imclose(temp_image, se);
    morphed_image = open_close_image; 
  
      
end
