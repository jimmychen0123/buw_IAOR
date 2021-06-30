function [image] = k_means_5d(point_matrix, k, x_dim, y_dim)
    
    % comment on the results:
    %   due to the fact that we extend our pointcloud to 5d, the
    %   distribution of our clusters shift. The xy coordinates influence
    %   the centers and therefore we have the areas + straight lines in the 
    %   background (see task_A_4e.jpg) 



    % input:
    % R | G | B | x | y | clustercenter
    cc = zeros(size(point_matrix,1) ,1);
    point_matrix = [point_matrix cc];
    
    % generate k random clustercenters ( r, g, b, x, y)

    clustercenter = rand(k,5);

        
    clustercenter_new = zeros(k,5);
    
    for i = 1:size(point_matrix,1)
        smallest_dist = 100000;
        cluster_c = -1;
        
        for c = 1:size(clustercenter,1)
            r = point_matrix(i,1)-clustercenter(c,1);
            g = point_matrix(i,2)-clustercenter(c,2);
            b = point_matrix(i,3)-clustercenter(c,3);
            % divide by 600 -> normalize x and y coordinate 
            x = point_matrix(i,4)/x_dim-clustercenter(c,4);
            y = point_matrix(i,5)/y_dim-clustercenter(c,5);
            
            
            dist = sqrt(r^2+g^2+b^2+x^2+y^2);
            
            
            if dist < smallest_dist
                cluster_c = c;
                smallest_dist = dist;
            end
        point_matrix(i,6) = cluster_c;
        end
        
        
    end
    
    pointmatrix(1,6) = 1;
    % update cluster center
    while true %(update_cluster == true)
        
        % sum of all points in the cluster
        sum_c = zeros(k,5);
        
        % number of points closest to the clustercenter
        num_points = zeros(k,1);
    
        % sum up all clustercenter points
        for i = 1:size(point_matrix,1)
            cluster = point_matrix(i,6);
            
           
            sum_c(cluster,1) = sum_c(cluster,1) + point_matrix(i,1);
            sum_c(cluster,2) = sum_c(cluster,2) + point_matrix(i,2);
            sum_c(cluster,3) = sum_c(cluster,3) + point_matrix(i,3);
            sum_c(cluster,4) = sum_c(cluster,4) + point_matrix(i,4)/x_dim;
            sum_c(cluster,5) = sum_c(cluster,5) + point_matrix(i,5)/y_dim;
            
        num_points(cluster) = num_points(cluster) + 1;
       
        end
        
        %num_points
        
        
        
        clustercenter_final_state = 0;
        
        % calculate mean values for new clustercenters
        for c = 1:size(clustercenter,1)
            
            
            clustercenter_new(c,1) = sum_c(c,1)/num_points(c);
            clustercenter_new(c,2) = sum_c(c,2)/num_points(c);
            clustercenter_new(c,3) = sum_c(c,3)/num_points(c);
            clustercenter_new(c,4) = sum_c(c,4)/num_points(c);
            clustercenter_new(c,5) = sum_c(c,5)/num_points(c);
            
            
            
            
            r = clustercenter_new(c,1)-clustercenter(c,1);
            g = clustercenter_new(c,2)-clustercenter(c,2);
            b = clustercenter_new(c,3)-clustercenter(c,3);
            x = clustercenter_new(c,4)-clustercenter(c,4);
            y = clustercenter_new(c,5)-clustercenter(c,5);
            
            %disp(['r ',num2str(r),' g ',num2str(g),' b ',num2str(b),' x ',num2str(x),' y ',num2str(y)])
            dist =sqrt(r^2+g^2+b^2+x^2+y^2);
            
            
        
             if dist < 500
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
            r = point_matrix(i,1)-clustercenter(c,1);
            g = point_matrix(i,2)-clustercenter(c,2);
            b = point_matrix(i,3)-clustercenter(c,3);
            x = point_matrix(i,4)/x_dim-clustercenter(c,4);
            y = point_matrix(i,5)/y_dim-clustercenter(c,5);
            
            
            dist =sqrt(r^2+g^2+b^2+x^2+y^2);
            
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
