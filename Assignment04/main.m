function  main()

% main function for assignment 4

    pkg load image;
  
    [origin_img, noise_img, denoise_img] = taskA('img/taskA.png');
  
    %Task a in Task B
    gray_image = loadAndConvert('img/trainB.png');
    test1 = loadAndConvert('img/test1B.jpg');
    test2 = loadAndConvert('img/test2B.jpg');
    test3 = loadAndConvert('img/test3B.jpg');
  
    [image] = taskB(gray_image, test1, test2, test3);


end


function [gray_image] = loadAndConvert (fileName)

    %loads and converts the image to a grayscaled image in values between 0.0 - 1.0
    I = im2double(imread(fileName));
    gray_image = rgb2gray(I);
    
end

function saveImage (image, filename)
  
  % saves the image to a jpg. Only the filename is needed.
  
  file = strcat(filename, '.jpg');
  imwrite(image, file, 'jpg');
 
end
