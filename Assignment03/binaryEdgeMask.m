function [binaryEdgeMaskImage] =  binaryEdgeMask(gradientMagnitudeImage)
    
    % we first test out the built-in gray threshhold, and then manually try which threshhold value is closed to desired output 
    
    %  threshhold = graythresh (gradientMagnitudeImage, 'concavity');
    %  binaryEdgeMask = im2bw(gradientMagnitudeImage, threshhold);
    
    threshhold = 0.04;
    
    tempImage = gradientMagnitudeImage(:,:,1);
   
    binaryEdgeMask = tempImage;
    binaryEdgeMask(tempImage>0.04) = 1;
    binaryEdgeMask(tempImage<0.04) = 0;

    binaryEdgeMaskImage = binaryEdgeMask;
    whos binaryEdgeMaskImage
    title_line = sprintf ('Binary Edge Mask, threshhold=%g', threshhold);
    subplot(1, 2, 2); imshow(binaryEdgeMaskImage, []); title(title_line);

    

    
end




