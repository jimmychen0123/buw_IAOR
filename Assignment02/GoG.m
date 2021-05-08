function GoG(image)
    % 1. Define standard deviation
    sigma = 0.5;

    % 2. Filter kernel radius
    r = cast(abs(3*sigma),'int32');       % abs  =  absoulte value
    
    % 3. define c_x and c_y arrays with (? * 2 + 1) columns and rows for
    % centered local coordinates:
    c_x = zeros(r*2+1,r*2+1);

    for row = 1:r*2+1
        for col = 1:r*2+1
            c_x(row,col) = cast(-(size(c_x,1)/2), 'int32') + col;
        end
    end
    
    c_y = c_x';

    % c_x = [-2,-1,0,1,2;
    %        -2,-1,0,1,2;
    %       -2,-1,0,1,2;
    %       -2,-1,0,1,2;
    %        -2,-1,0,1,2;]
    
    % 4. compute filter using c_x and c_y for x and y
    
    GoG_filter_x = gradient(c_x,c_y, sigma);
    
    GoG_filter_y = gradient(c_y,c_x, sigma);
   
  
    im_x = apply_filter(image, GoG_filter_x, r);
    im_y = apply_filter(image, GoG_filter_y, r);
    
%    If limits is a 2-element vector [low, high], the image is shown using a display range between low and high. If an empty matrix is passed for limits, the display range is computed as the range between the minimal and the maximal value in the image.
    figure('name', 'gogX'), imshow(im_x, [])
    figure('name', 'gogY'), imshow(im_y, [])
    
    %Compute and visualize the gradient magnitude image ?
    G = sqrt(im_x.^2 + im_y.^2);
    figure('name', 'gradient magnitude image'), imshow(G, [])
end

function [GoG_filter] = gradient(x, y, sigma)
    %input: x and y, sigma = mask radius
%    grd_x = -(x./2*pi*sigma^4)
%    GoG_filter = grd_x.*exp(-(x.^2+y.^2)/2*sigma^2)
    
    term_1 = -(x./2*pi*sigma^4);
    term_2 = -(x.^2 + y.^2) / 2*sigma^2;
    GoG_filter = term_1.*exp( term_2 )
    
end

% input image, filter, filter radius
function g = apply_filter(image, filter, r)
    % convolution h*f
    g = zeros(size(image,1), size(image,2));
    for i = 5:size(image,1)-5
        fprintf('row = %d \n', i)
        for j = 5:size(image,2)-5
            val = 0;
            
            for u = 1:2* r + 1
                for v = 1:2* r + 1
                    val = val + filter(u,v) * image(i+u,j+v);
                    if val > 255
                        val = 254;
                    end
                end
             
                
            g(i,j) = val;
            end
        end
    end
end
