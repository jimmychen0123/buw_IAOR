function [image] = mean_shift(filePath)
  
    % build feature space based on R G B
    I = imread(filePath);
    rgbImage = im2double(I);
    
    red_channel = rgbImage(:, :, 1);
    green_channel = rgbImage(:, :, 2);
    blue_channel = rgbImage(:, :, 3);
    
    data_points = [red_channel(:), green_channel(:), blue_channel(:)];
    whos data_points;
    
    % plot the origin image
    figure;
    subplot(1, 2, 1);
    imshow(rgbImage);
    title("Origin image");
    
    % visualise the origin feature space
    figure;
    subplot(1, 2, 1);
    scatter3(red_channel, green_channel, blue_channel); 
    title("Origin feature space");
  
    % Define window size, which will determine the neighbors within the window / kernel
    window_size = 0.2; % Need to be reconsidered 
    
    % threshhold for convegence
    threshhold = 0.05
    
    % variables to check convegence
    old_centroid = zeros(1, 3); 
    new_centroid = zeros(1, 3); 
        
    % Initialize windows at individual feature points
    
    for i = 1 : size (data_points, 1) % first loop for each data point to find its mode
        
        weightXYZ = zeros(1, 3); % create 1 by 3 matrix to store the weight of dataa points within the window
        nm_dps = 0; % number of data points within the window
        
        data_points(i, :) % current data point
        
        % we need a while loop as a condition for convegence
        while 1
            
            old_centroid = data_points(i, :); % current data point as a centroid
            
            for j = 1 : size (data_points, 1) % the second loop to find all the data points within the window
            
                window_center = data_points(i, :); %window center
                possible_dp = data_points(j, :); %possible data point
            
                distance = calculate_distance(possible_dp, window_center); % debug
            
                if (distance < window_size)
                
                    weightXYZ += possible_dp;
                    nm_dps += 1;
                
                end %end if  
             
            end % end second loop
        
            % compute the mean
            new_centroid = weightXYZ / nm_dps;
            
            if calculate_distance(new_centroid, old_centroid) < threshhold
                
                break
                
            end % end if
        
            % shift the window
            data_points(i, :) = new_centroid;
            
        end % end while
        
         
        
    end % end first loop
    
    image = data_points;
    
    % visualise the feature space after mean shift 
    subplot(1, 2, 2);
%    scatter3(data_points(:, 1), data_points(:, 2), data_points(:, 3)); 
    scatter3(red_channel, green_channel, blue_channel); 
    title("feature space after mean shift");
        
        
   


 

  
  %Function to calculate distance 
  
  % Function to determine the neighbors
  % calculate the distance inbetween two points and look if it is within the windows size
  % the window size used as max distance to dermine the neighbors
  % Output will be an array of neighbors
  
  % Make all datapoints centroids
 
  
end % end function

function [distance] = calculate_distance(A,B)
  result = B-A;
  distance = sqrt( result(1)^2 + result(2)^2 + result(3)^2);
end 
 
 