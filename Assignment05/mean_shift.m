function [image] = mean_shift(point_matrix)
   
  % Define window size, which will determine the neighbors within the window / kernel
  window = 0.2; % Need to be reconsidered 

  % Number of iterations / convergence
  iterations = 2; % Need to be reconsidered     

  %Function to calculate distance 
  
  % Function to determine the neighbors
  % calculate the distance inbetween two points and look if it is within the windows size
  % the window size used as max distance to dermine the neighbors
  % Output will be an array of neighbors
  
  
  % 
  neighbors=[];
  
  % Iterate through the feature point  
  % loop x
  for i=1:size(point_matrix,4)
    % loop y
    for j=1:size(point_matrix,5)
     comparator =  point_matrix(:,:,:,i,j);
      
      % iterate through neighbors
      % loop x
      for k=1:size(point_matrix,4)
        % loop y
        for l=1:size(point_matrix,5)
%              A = point_matrix(:,:,:,k,l); 
%              B = point_matrix(:,:,:,i,j);
%             distance = calculate_distance(point_matrix(:,:,:,i,j),point_matrix(:,:,:,k,l));
%            if distance <= window 
%              neighbors distance 
%            end
          
        end
      end      
    end
  end
  
end

function [distance] = calculate_distance(A,B)
  result = B-A;
  distance = sqrt( result(1)^2 + result(2)^2 + result(3)^2)
 end 
 
 