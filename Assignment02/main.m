function main()

% main function for assignment 2
% pkg load image;
gray_image = loadAndConvert('img/ampelmaennchen.png');

%originalImage = imread(fileName);

GoG(gray_image);

end


function [gray_image] = loadAndConvert (fileName)
  

  
  %loads and converts the image to a grayscaled image
  disp(fileName);
  originImage = imread(fileName);
  imageToDouble = double(im2double(originImage));  
  figure('name', 'imageToDouble'), imshow(imageToDouble)
%  rgb2 and calculate the mean is redundant. Either rgb2gray or the mean
%  gray_image = uint8(mean(originImage, 3));
  gray_image = rgb2gray(imageToDouble);
  gray_image;
  figure('name', 'gray image'), imshow(gray_image)
 
end
