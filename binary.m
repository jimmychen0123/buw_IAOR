function [binaryImage] = binary(enhancedImage)
  
  % Convert the enhanced image to a binary mask, 
  %   0 = background, 1 = region of interest
 
  binaryImage = im2bw(enhancedImage, graythresh(enhancedImage));

end
