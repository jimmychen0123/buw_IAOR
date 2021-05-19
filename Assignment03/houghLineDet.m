function [] =  houghLineDet(image, im_x, im_y)
    
    %task c
    %apply threshold to image
    BW = imbinarize(image);
    figure('name', 'thresholded'), imshow(BW, [])
    
    % initialize index vectors
    rho_max = cast(sqrt(size(image,1)^2+size(image,2)^2), 'int32');
    
    % initialize voting array
    H = zeros(180, 2*rho_max+1);
    figure('name', 'voting array'), imshow(H, [])
    for x = 1:size(image,1)
        for y = 1:size(image,2)
            % if pixel is white -> edge detected
            if BW(x,y) == 1
                % gradient detection
                theta = atan(im_y(x,y)/im_x(x,y));
                rho = x*cos(theta)+y*sin(theta);
                % cast to int
                theta = cast(theta+91, 'int32');
                rho = cast(rho+rho_max, 'int32');
                
                H(theta,rho) = H(theta, rho) + 1;
            end
        end
    end
    
    figure('name', 'voting array'), imshow(H, [])
    

end