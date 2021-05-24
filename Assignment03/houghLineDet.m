function [H] =  houghLineDet(binaryEdgeMaskImage, Ix, Iy)
    
    % output H = voting array, index_array the ranges of theta and rho(p) 
   
    % initialize index vectors
    rho_max = round(sqrt(size(binaryEdgeMaskImage,1)^2+size(binaryEdgeMaskImage,2)^2)); % edge image’s diagonal
    rho_range = [-rho_max, rho_max];
    theta_range = [-90, 89];
    
    % initialize voting array
    num_rows = 180;
    num_cols = 2*rho_max+1;
    
    H = zeros(num_rows, num_cols);
    
    figure('name', 'voting array'), imshow(H, [])
    for x = 1:size(binaryEdgeMaskImage,1)
        for y = 1:size(binaryEdgeMaskImage,2)
            % if pixel is white -> edge detected
            if binaryEdgeMaskImage(x,y) == 1 
                % gradient detection
                theta = atan(Iy(x,y)/Ix(x,y));
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