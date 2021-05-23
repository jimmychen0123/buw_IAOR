function [H] = main()

    % main function for assignment 3
    pkg load image;
  
    I = double(imread('img/input_ex3.jpg')) / 255; % convert unit8 to double with value range from 0.0 - 1.0
    GrayScaleImage = mean(I,3);
  
    gradientMagnitudeImage = gradientMagnitude(GrayScaleImage);
    binaryEdgeMask = binaryEdgeMask(gradientMagnitudeImage);
   
  
      
  
  
%  [H] = houghLineDet(G, im_x, im_y);
  
  % Plot the resulting Hough voting array H
%  imshow(H,[0, 10]);
  
  % Find local maxima of H
%  local_maxima = houghpeaks(H); % Not tested.
  
end



function saveImage (image, filename)
  
  % saves the image to a jpg. Only the filename is needed.
  
  file = strcat(filename, '.jpg');
  imwrite(image, file, 'jpg');
 
end
