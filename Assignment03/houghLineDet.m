function [H, index_theta, index_rho] =  houghLineDet(image, im_x, im_y)
    % output H = voting array, index_array the ranges of theta and rho(p) 
    
    %task c
    %apply threshold to image
    BW = im2bw(image, graythresh(image));
    figure('name', 'thresholded'), imshow(BW, []);
    
    % initialize index vectors
    rho_max = round(sqrt(size(BW,1)^2+size(BW,2)^2));
    index_theta = [-90: 1: 89]; %define theta range
    index_rho = [-rho_max: 1: rho_max]; %define rho range
    
    % initialize voting array
    num_cols = 181;
    num_rows = 2*rho_max+1;
    H = zeros(num_rows, num_cols);
    for x = 1:size(BW,1)
        for y = 1:size(BW,2)
            % if pixel is white -> edge detected
            if BW(x,y) == 1 
                % gradient detection
                theta = round(atand(im_y(x,y)/im_x(x,y)));
                rho = round(x*cosd(theta)+y*sind(theta));
                % cast to int
                h_theta = round(theta) + 91;
                h_rho = round(rho) + rho_max;
                
                H(h_rho,h_theta) = H(h_rho, h_theta) + 1;
            end
        end
    end
    
      % Task e and f
    % find local maxima with MATLAB function houghpeaks
%    peaks = 20;
%    %P = houghpeaks(H, peaks, 'threshold', ceil(0.3 * max(H(:))));
%    P = houghpeaks(H, peaks, 'threshold', 0.1);
%    imshow(H,[],'XData',index_theta,'YData',index_rho,'InitialMagnification','fit');
%    xlabel('\theta'), ylabel('\rho');
%    axis on, axis normal, hold on;
%    plot(index_theta(P(:,2)),index_rho(P(:,1)),'s','color','red');
%    hold off;
    
    figure, imshow (H, [],"XData",index_theta,"YData",index_rho);
    title ("Hough transform of edge image \n 2 peaks marked");
    axis on; xlabel("theta [degrees]"); ylabel("rho [pixels]");
    peaks = houghpeaks (H, 20);
    peaks_rho = index_rho(peaks(:,1))
    peaks_theta = index_theta(peaks(:,2))
    hold on;
    plot(peaks_theta,peaks_rho,"sr");
    hold off;
    

end