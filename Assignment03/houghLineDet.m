function [H, index_theta, index_rho] =  houghLineDet(image, im_x, im_y)
    % output H = voting array, index_array the ranges of theta and rho(p) 
    
    %task c
    %apply threshold to image
    %BW = imbinarize(image);
    BW = im2bw(image, graythresh(image));
    % figure('name', 'thresholded'), imshow(BW, []);
    
    % initialize index vectors
    rho_max = cast(sqrt(size(image,1)^2+size(image,2)^2), 'int32');
    
    % initialize voting array
    num_cols = 181;
    H = zeros(num_cols, 2*rho_max+1);
    for x = 1:size(image,1)
        for y = 1:size(image,2)
            % if pixel is white -> edge detected
            if BW(x,y) == 1 
                % gradient detection
                theta = atand(im_y(x,y)/im_x(x,y));
                rho = x*cosd(theta)+y*sind(theta);
                % cast to int
                theta = cast(theta+91, 'int32');
                rho = cast(rho+rho_max, 'int32');
                
                H(theta,rho) = H(theta, rho) + 1;
            end
        end
    end
    
    figure('name', 'voting array'), imshow(H, [])
    

end