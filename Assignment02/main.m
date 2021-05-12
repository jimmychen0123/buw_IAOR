function main()

% main function for assignment 2
% pkg load image;
  gray_image = loadAndConvert('img/ampelmaennchen.png');

 %originalImage = imread(fileName);

  [im_x, im_y] = GoG(gray_image);
  [W, Q, binaryMask] = foerstner(gray_image, im_x, im_y);

  resultImage = gray_image + binaryMask;
  figure('name', 'binary mask'), imshow(resultImage);
end


function [gray_image] = loadAndConvert (fileName)
  %loads and converts the image to a grayscaled image
  
  disp(fileName);
  originImage = imread(fileName);
  whos originImage
  
  imageToDouble = im2double(originImage);  
  %figure('name', 'imageToDouble'), imshow(imageToDouble)
%  rgb2 and calculate the mean is redundant. Either rgb2gray or the mean
%  gray_image = uint8(mean(originImage, 3));
  gray_image = rgb2gray(imageToDouble);
  whos gray_image
  %figure('name', 'gray image'), imshow(gray_image)
end

function saveImage (image, filename)
  
  % saves the image to a jpg. Only the filename is needed.
  
  file = strcat(filename, '.jpg');
  imwrite(image, file, 'jpg');
 
end
