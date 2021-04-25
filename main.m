function [outputImage] = main
  % Scripts contain executable code. They are basically the "main" programs. 

  % By default installed packages are not available from the Octave prompt. The functions from a package should be added to the Octave path first
  pkg load image;

  %Two images as input
  gray_image = loadAndConvert('input_sat_image.jpg');
##  gray_image = loadAndConvert('andreas-gucklhorn-7nV4CZSIoxg-unsplash.jpg');
  
##  enhancedImage = enhanceContrast(grayScaleImage);
  enhancedImage = enhanceContrastV(gray_image);
  
  %To visual compare both images if there are any differences 
## figure(1), imshow(enhancedImage);
## figure(2), imshow(enhancedImageV);
## binaryCompareGraytresh (enhancedImage);
  
  binaryImage = binary(enhancedImage);  
  morphedImage = morphFilter(binaryImage);
  
  overlay(enhancedImage, morphedImage);
 
 end