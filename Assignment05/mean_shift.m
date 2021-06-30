function [image] = mean_shift(I) 
    
    % Task B: The effect of window size
    % The large windoe size is the less number of the clustering would be found. Hence, with larger window size, more details(colours) in the image segmentation can be seen. In addition, to reduce the computing expense we tried to adjust the window size (the larger the window size is the less of computing time)
    
    % Task D: Compare the results produced with the algorithms from k mean and mean shift
    % Unlike the K-Means cluster algorithm, mean-shift does not require specifying the number of clusters in advance. Hence, more details (e.g colours) in the image may be reserved by the window size in the mean shift algorithm, or the pre-define clustering number in the k mean alorithm
    
    % Task E: How to accelerate the operation of mean shift?
    % Although we are not able to generate the desired result, during the implementation, we tried to only use sample of the feature points(e.g start with every 1000th pixel as a centroid, if the window is large enough it will probably cluster every pixel). The mean algorithm’s runtime complexity is O(KN2), , where N is the number of datapoints and K is the number of iterations of Meanshift. Another approach is to limit the number of iterations.
    
    % Note: We are not able to complete the algorithm, however please have a look at our rationale by the comments below for our logical thining process
    
    % build feature space based on R G B
    % R | G | B | label
    cc = zeros(size(I,1) ,1);
    data_points = [I(:, 1:3), cc];

    whos data_points
    
    % plot the origin image
    figure;
    subplot(1, 2, 1);
    title("Origin image");
    
    % visualise the origin feature space
    figure;
    subplot(1, 2, 1);
    scatter3(I(:, 1), I(:, 2), I(:, 3), 12, I(:, 1 : 3)); 
    title("Origin feature space");
  
    % Pre-define varaibles
    
    % Window size, which will determine the neighbors within the window / kernel, it need to be adjusted accordingly
    window_size = 0.2; 
    
    % Sampling window number 
    sample_size = 100;
    
    % Threshhold for convegence
    threshhold = 0.05;
      
      
    % based on the visualization of detected groups in feature space, either we manually assign local sample data points to save the cost of the operation or randonly assign the data point value
    
%    centroid_list = [0.2 0.2 0.2; 0.4 0.4 0.4; 0.6 0.6 0.6; 0.8 0.8 0.8;  ]; % manually assign
    
    for i = 1:20 % randonly assign
        
        max = size(data_points,1);
        r = randi([1,max],1);
        center_list(i,1) = data_points(r,1);
        center_list(i,2) = data_points(r,2);
        center_list(i,3) = data_points(r,3);
        
    end
    
    % initialize window

    old_center_list = center_list
    for i = 1 : size (center_list, 1) % first loop for each data point to find its mode
        
        weightXYZ = zeros(1, 3); % create 1 by 3 matrix to store the weight of data points within the window
        nm_dps = 0; % number of data points within the window
        dpsIndex_inside = [];
        
        % we need a while loop as a condition for convegence
            
        old_centroid = data_points(i, :); % current data point as a centroid
        
        for j = 1 : size (data_points, 1) % the second loop to find all the data points within the window
        
            window_center = center_list(i, :); %window center
            possible_dp = data_points(j, 1:3); %possible data point
        
            distance = calculate_distance(possible_dp, window_center); % debug
        
            if (distance < window_size)
                
%            
                weightXYZ =  weightXYZ + possible_dp;
                nm_dps = nm_dps + 1;
                
            
            end %end if  
         
        end % end second loop
    
        % compute the mean
        new_centroid = weightXYZ / nm_dps;
    
        % shift the window
        center_list(i, 1:3) = new_centroid;
            
    end % end first loop
    
    % merge centroids:
    
    new_center_list = zeros(1:20,3)
    for i = 1:20
        new_center_list(i,:) = center_list(i,:)
        
        for j = 1:20
           
        end
    end
    
    
    center_list
    image = data_points;
    
    % visualise the feature space after mean shift 
    subplot(1, 2, 2); 
    title("feature space after mean shift");
        
  
end % end function

function [distance] = calculate_distance(A,B)
  result = B-A;
  distance = sqrt( result(1)^2 + result(2)^2 + result(3)^2);
end 
 
 