function  main()

% main function for assignment 3
  pkg load image;
  gray_image = loadAndConvert('img/input_ex3.jpg');

 %originalImage = imread(fileName);
 % copied from last assignment
  [im_x, im_y, G] = GoG(gray_image);
  
  [H] = houghLineDet(G, im_x, im_y);
  
  % Plot the resulting Hough voting array H
  imshow(H,[0, 10]);
  
  % Find local maxima of H
  local_maxima = houghpeaks(H); % Not tested.
  
  
end


function [gray_image] = loadAndConvert (fileName)
  %loads and converts the image to a grayscaled image
  
  disp(fileName);
  originImage = imread(fileName);
  whos originImage;
  
  imageToDouble = im2double(originImage);  
  %figure('name', 'imageToDouble'), imshow(imageToDouble)
%  rgb2 and calculate the mean is redundant. Either rgb2gray or the mean
%  gray_image = uint8(mean(originImage, 3));
  gray_image = rgb2gray(imageToDouble);
  whos gray_image;
  %figure('name', 'gray image'), imshow(gray_image)
end

function saveImage (image, filename)
  
  % saves the image to a jpg. Only the filename is needed.
  
  file = strcat(filename, '.jpg');
  imwrite(image, file, 'jpg');
 
end