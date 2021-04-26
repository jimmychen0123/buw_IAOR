function [outputImage] = main
  % Scripts contain executable code. They are basically the "main" programs. 

  % By default installed packages are not available from the Octave prompt. The functions from a package should be added to the Octave path first
  pkg load image;

 %Two images as input
 gray_image = loadAndConvert('input_sat_image.jpg');
##  gray_image = loadAndConvert('andreas-gucklhorn-7nV4CZSIoxg-unsplash.jpg');
=======
  %fileName = input('Enter the file name inside single quotes: ');

  % grayScaleImage = loadAndConvert('image2.jpg');
  
##  enhancedImage = enhanceContrast(grayScaleImage);
enhancedImage = enhanceContrastV(gray_image);
  
%To visual compare both images if there are any differences 
## figure(1), imshow(enhancedImage);
## figure(2), imshow(enhancedImageV);
## binaryCompareGraytresh (enhancedImage);
  
binaryImage = binary(enhancedImage);  
morphedImage = morphFilter(binaryImage);

% saveImage(binaryImage, 'binaryImage1_1');
  
overlay(enhancedImage, morphedImage);
 
outputImage = morphedImage;
saveImage(outputImage, 'outImage1');

end