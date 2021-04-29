function [gray_image] = loadAndConvert (fileName)

  %loads and converts the image to a grayscaled image
  disp(fileName);
  originImage = imread(fileName);
  figure('name', 'origin image'), imshow(originImage)
  
##  rgb2 and calculate the mean is redundant. Either rgb2gray or the mean
  gray_image = uint8(mean(originImage, 3));
  %gray_image = uint8(rgb2gray(originImage));
  
  %figure('name', 'gray image before enhancement'), imshow(gray_image)
  %figure('name', 'histogram of gray image before enhancement'), imhist(gray_image);
 
endfunction
