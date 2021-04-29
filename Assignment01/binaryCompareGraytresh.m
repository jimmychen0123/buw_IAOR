function [binaryImage] = binaryCompareGraytresh (enhancedImage)
  
  % Convert the enhanced image to a binary mask, 
  %   0 = background, 1 = region of interest
  grayThreshOption = {'moments'; 'mean'; 'Otsu'};
  
##  moments : ans = 0.4549
##  mean    : ans = 0.4209
##  Otsu    : ans = 0.4353

  for i = 1 : size(grayThreshOption, 1)
    
    binaryImage = im2bw(enhancedImage, graythresh(enhancedImage, grayThreshOption{i,1}));
    
##    Show different grayTreshOptions
##    disp(grayThreshOption{i});
##    graythresh(enhancedImage,grayThreshOption{i,1})
##    figure(i), imshow(binaryImage);

##    saveImage(binaryImage, grayThreshOption{i}); 
 endfor
  
  %n = input('Enter the figure number for morphological operation: ')
  
##  switch n
##    case 5
##      binaryImage = im2bw(enhancedImage, graythresh(enhancedImage, grayThreshOption{1,1}));
##      saveImage(binaryImage, grayThreshOption{1,1});
##    case 6
##      binaryImage = im2bw(enhancedImage, graythresh(enhancedImage, grayThreshOption{2,1}));
##      saveImage(binaryImage, grayThreshOption{2,1});
##    case 7
##      binaryImage = im2bw(enhancedImage, graythresh(enhancedImage, grayThreshOption{3,1}));
##      saveImage(binaryImage, grayThreshOption{3,1});
##    otherwise
##      binaryImage = im2bw(enhancedImage, graythresh(enhancedImage, grayThreshOption{3,1}));
##      saveImage(binaryImage, grayThreshOption{3,1});
##  endswitch
##  binaryImage = im2bw(enhancedImage, graythresh(enhancedImage, 'moments'));
##  figure(5);
##  imshow(binaryImage);
##  
##  binaryImage = im2bw(enhancedImage, graythresh(enhancedImage));
##  figure(6);
##  imshow(binaryImage);
##  
##  binaryImage = im2bw(enhancedImage, graythresh(enhancedImage, 'mean'));
##  figure(7);
##  imshow(binaryImage);
endfunction
