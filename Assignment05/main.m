function  main()

% main function for assignment 4

    %pkg load image;
    [F] = loadAndConvert('img/inputEx5_2.jpg');
    figure
    scatter3(F(:,1),F(:,2), F(:,3),'.','r')


end


function [out] = loadAndConvert (fileName)

    %loads the image
    I = im2double(imread(fileName));
    F = reshape(I,[],3);
    
    coord = zeros(size(I,1)*size(I,2),2);
    
    it = 1;
    x = 1;
    for i=1:size(I,1)
        y = 1;
        for j=1:size(I,2)
            
            coord(it,1) = x;
            coord(it,2) = y;
            y = y+1;
            it = it+1;
        end
        x = x+1;
            
    end
    
    %coord
    
    % outputs a matrix of the form:
    % R | G | B | x | y
    out = [F coord]
   	
    
 
end

function saveImage (image, filename)
  
  % saves the image to a jpg. Only the filename is needed.
  file = strcat(filename, '.jpg');
  imwrite(image, file, 'jpg');
 
end
