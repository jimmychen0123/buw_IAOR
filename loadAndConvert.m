function [gray_image] = loadAndConvert (fileName)

  %loads and converts the image to a grayscaled image
  disp(fileName);
  originImage = imread(fileName);
    
  % rgb2 and calculate the mean is redundant. Either rgb2gray or the main  
  %grayScaleImage = uint8(mean(rgb2gray(originImage), 3));
  %gray_image = uint8(mean(originImage), 3);
  
  gray_image = uint8(rgb2gray(originImage));
  
  %figure(1), imshow(grayScaleImage);
  %figure(2), imhist(grayScaleImage);
  
  #{
  Shortly describe the characteristics of the histogram: 
  Histogram is a graph showing the number of pixels in an image(y axis) at each different intensity value(x axis) found in that image.
  #}

endfunction
