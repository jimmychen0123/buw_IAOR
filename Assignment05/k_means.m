function k_means(point_matrix, k)
    
    % input:
    % R | G | B | x | y | clustercenter
    cc = zeros(size(point_matrix,1) ,1);
    point_matrix = [point_matrix cc];
    
    % generate k random clustercenters ( r, g, b)

    clustercenter = rand(k,3);
    
    for i = 1:size(point_matrix,1)
        smallest_dist = 1;
        cluster_c = -1;
        
        for c = 1:size(clustercenter,1)
            x = point_matrix(i,1)-clustercenter(c,1);
            y = point_matrix(i,2)-clustercenter(c,2);
            z = point_matrix(i,3)-clustercenter(c,3);
            
            dist =sqrt(x^2+y^2+z^2);
            
            if dist < smallest_dist
                cluster_c = c;
                smallest_dist = dist;
            end
        point_matrix(i,6) = cluster_c;
        end
    end

    
    % for each point: calculate closest cluster center
        % set clustercenter 1,2,3,4 
    % 
    %clustercenter[] -> [x,y,z]= c1
    % for each row in matrix:
        % meanvalue c1
        % meanvalue c2
        % meanvalue c3
        % meanvalue c4
        
        %update cluster center
    % sum of all points in the cluster
    sum_c = zeros(k,3);
        
    % number of points closest to the clustercenter
    num_points = zeros(k,1);
            
    for i = 1:size(point_matrix,1)
        cluster = point_matrix(i,6);
        sum_c(cluster,1) = sum_c(cluster,1) + point_matrix(i,1);
        sum_c(cluster,2) = sum_c(cluster,2) + point_matrix(i,2);
        sum_c(cluster,3) = sum_c(cluster,3) + point_matrix(i,3);
         
        num_points(cluster) = num_points(cluster) + 1;
        
        
        
    
    end
    
    sum_c
    num_points
    
    for c = 1:size(clustercenter,1)
        mean_x = sum_c(c,1)/num_points(c,1)
    end
    
    
        
  
    
    
end

function clac_closest_clustercenter()


end