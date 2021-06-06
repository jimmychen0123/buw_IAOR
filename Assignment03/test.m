 I = checkerboard (30, 1, 1);
 I = imnoise(I, "salt & pepper", 0.2);
 figure, imshow (I); 
 title ("noisy image with some lines");
 BW = edge (I, "canny");
 figure, imshow(BW);
 title ("edge image");
 [H, theta, rho] = hough (BW);
 figure, imshow (mat2gray (H), [],"XData",theta,"YData",rho);
 title ("Hough transform of edge image \n 2 peaks marked");
 axis on; xlabel("theta [degrees]"); ylabel("rho [pixels]");
 peaks = houghpeaks (H, 2);
 peaks_rho = rho(peaks(:,1))
 peaks_theta = theta(peaks(:,2))
 hold on;
 plot(peaks_theta,peaks_rho,"sr");
 hold off;