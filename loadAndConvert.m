function grayScaleImage = loadAndConvert (fileName)

  %loads and converts the image to a grayscaled image
  disp(fileName);
  originImage = imread(fileName);
    
  grayScaleImage = uint8(mean(rgb2gray(originImage), 3));
  
  figure(1), imshow(grayScaleImage);
  figure(2), imhist(grayScaleImage);
  
  #{
  Shortly describe the characteristics of the histogram: 
  Histogram is a graph showing the number of pixels in an image(y axis) at each different intensity value(x axis) found in that image.
  #}

endfunction
