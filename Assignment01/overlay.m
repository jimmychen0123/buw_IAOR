

function finalOverlayImage = overlay (enhancedImage, morphedImage)
  
  finalOverlayImage = enhancedImage;
  finalOverlayImage(morphedImage) = 255;

  figure('name','Final overlay image'), imshow(finalOverlayImage);

endfunction
