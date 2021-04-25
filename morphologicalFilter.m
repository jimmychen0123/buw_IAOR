

function [openImage, closeImage] = morphologicalFilter (binaryImage)
  
  openImage = imopen(binaryImage, strel('square',5));
  figure();
  imshow(openImage);

endfunction
