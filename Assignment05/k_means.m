function [image] = k_means(point_matrix, k)
    
    % input:
    % R | G | B | x | y | clustercenter
    cc = zeros(size(point_matrix,1) ,1);
    point_matrix = [point_matrix cc];
    
    % generate k random clustercenters ( r, g, b)

    clustercenter = rand(k,3);
    clustercenter_new = zeros(k,3);
    
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

    
    while true %(update_cluster == true)
        
        % sum of all points in the cluster
        sum_c = zeros(k,3);
        
        % number of points closest to the clustercenter
        num_points = zeros(k,1);
    
        % sum up all clustercenter points
        for i = 1:size(point_matrix,1)
            cluster = point_matrix(i,6);
            sum_c(cluster,1) = sum_c(cluster,1) + point_matrix(i,1);
            sum_c(cluster,2) = sum_c(cluster,2) + point_matrix(i,2);
            sum_c(cluster,3) = sum_c(cluster,3) + point_matrix(i,3);
         
        num_points(cluster) = num_points(cluster) + 1;
       
        end
        
        clustercenter_final_state = 0;
        
        % calculate mean values for new clustercenters
        for c = 1:size(clustercenter,1)
            clustercenter_new(c,1) = sum_c(c,1)/num_points(c);
            clustercenter_new(c,2) = sum_c(c,2)/num_points(c);
            clustercenter_new(c,3) = sum_c(c,3)/num_points(c);
            
            x = clustercenter_new(c,1)-clustercenter(c,1);
            y = clustercenter_new(c,2)-clustercenter(c,2);
            z = clustercenter_new(c,3)-clustercenter(c,3);
            
            dist =sqrt(x^2+y^2+z^2);
            
        
             if dist < 0.7
                clustercenter_final_state = clustercenter_final_state +1;
            end
        end
    
        % stop clause
        if (clustercenter_final_state == k)
            break;
        end

    
    end
    clustercenter
    
    %update points to new clustercenters
    for i = 1:size(point_matrix,1)
        smallest_dist = 1.5;
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
    
    image = zeros(600,600,3);
    colors = rand(k,3)

    
    for i = 1:size(point_matrix,1)
        cl_center = point_matrix(i,6);
        color = colors(cl_center,:);
        image(point_matrix(i,4),point_matrix(i,5),1) = color(1,1);
        image(point_matrix(i,4),point_matrix(i,5),2) = color(1,2);
        image(point_matrix(i,4),point_matrix(i,5),3) = color(1,3);
    end
    
    
    
    
end
