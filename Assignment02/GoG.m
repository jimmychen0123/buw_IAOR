function GoG(image)
    % input image matrix with floating point values between 0 and 1
    
    % define c_x and c_y arrays:
    c_x = [-2,-1,0,1,2;
           -2,-1,0,1,2;
           -2,-1,0,1,2;
           -2,-1,0,1,2;
           -2,-1,0,1,2;];
    c_y = c_x'
    
    grd_x = (x/2*pi*sigma^4)*exp((x^2+y^2)/2*sigma^2);
    grd_y = (x/2*pi*sigma^4)*exp((x^2+y^2)/2*sigma^2);
    
    for i = 3:size(image,1)-3
        for j = 3:size(image,2)-3
            
        end
    end
    
end

function [grd_x, grd_y] = gradient(x, y, sigma)
    %input: x and y, sigma = mask radius
    grd_x = (x/2*pi*sigma^4)*exp((x^2+y^2)/2*sigma^2);
    grd_y = (x/2*pi*sigma^4)*exp((x^2+y^2)/2*sigma^2);
    
end