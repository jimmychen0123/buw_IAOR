function [outputImage] = main
  % Scripts contain executable code. They are basically the "main" programs. 

  % By default installed packages are not available from the Octave prompt. The functions from a package should be added to the Octave path first
  pkg load image;

  %fileName = input('Enter the file name inside single quotes: ');

  grayScaleImage = loadAndConvert('image2.jpg');
  
##  enhancedImage = enhanceContrast(grayScaleImage);
  enhancedImage = enhanceContrastV(grayScaleImage);
  
## To visual compare both images if there are any differences 
## figure(1), imshow(enhancedImage);
## figure(2), imshow(enhancedImageV);
##  binaryCompareGraytresh (enhancedImage);
  
  binaryImage = binary(enhancedImage);
  saveImage(~binaryImage, 'binaryImage2');
  
  morphedImage = morphFilter(~binaryImage);
 
  outputImage = morphedImage;

  
 end