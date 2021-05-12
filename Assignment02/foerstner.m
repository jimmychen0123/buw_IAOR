function [W,Q, binaryMask] = foerstner(originImage, I_x, I_y)
% input is original image and the two gradient images Ix and Iy
   I_x2 = I_x.^2;
   I_y2 = I_y.^2;
   I_xy = I_x.*I_y;
   
   T_W = 0.001 % Treshold of tw
   T_Q = 0.5 % Trehsold of tq
   
% a compute autocorrelation matrix (from 3 to size-3 because borders)

   W = zeros(size(originImage,1), size(originImage,2));
   Q = zeros(size(originImage,1), size(originImage,2));
     
    for x = 3:size(originImage,1)-3
        for y = 3:size(originImage,2)-3
            % autocorrelation matrix
            M = compute_autocorr_matrix(I_x2, I_y2, I_xy, x,y);
            %cornerness
            w = trace(M)/2-sqrt((trace(M)/2)^2-det(M));
            %W(x,y) = w;
            
            % Check if treshold is met (Task c)
            if w > T_W 
              W(x,y) = w;
            end
            
            %roundness
            q = (4*det(M))/(trace(M)^2);
            
            % Check if treshold is met (Task c)
            if q > T_Q
             Q(x,y) = q;  
            end          
        end
    end
    
    % b compute cornerness and roundness

     figure('name', 'W'), imshow(W, []),colormap('jet');

     figure('name', 'Q'), imshow(Q, []),colormap('jet');     

% c derive bianry mask
    binaryMask = deriveBinaryMask (W,Q,originImage);    
end

function [binaryMask] = deriveBinaryMask (W,Q,originImage)
    % Task c, apply tresholds simultaneously on W and Q
    T_W = 0.004;
    T_Q = 0.5;
  
     binaryMask = zeros(size(originImage));
     for j = 1:numel(W)
       if W(j) > T_W % Treshold
         if Q(j) > T_Q % Treshold 
           binaryMask(j) = 1; % 1 = region of interest          
         end
       end
     end
end;  



function M = compute_autocorr_matrix(I_x2, I_y2, I_xy, x, y)
    % wn  = 1 matrix -> just multiply every value times 1
    M = 0;
    for i = x-2:x+2
           for j = y-2:y+2
                M = M + 1*[I_x2(i,j), I_xy(i,j);
                         I_xy(i,j),I_y2(i,j)];
           end
    end 
end