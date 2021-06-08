function  main()

% main function for assignment 4

  pkg load image;
  
  [origin_img, noise_img, denoise_img] = taskA('img/taskA.png');
  
  taskAImage = loadAndConvert('img/taskA.png');
  
  gray_image = loadAndConvert('img/trainB.png');
%  test1 = loadAndConvert('img/test1B.jpg');
%  test2 = loadAndConvert('img/test2B.jpg');
%  test3 = loadAndConvert('img/test3B.jpg');
  
   noise_image = taskA(taskAImage);
   ifigure('name', 'Task A: Imnoise image'), imshow(noise_img);
%  imshow(imnoise_image);
%  [image] = taskB(gray_image, test1, test2, test3);

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
