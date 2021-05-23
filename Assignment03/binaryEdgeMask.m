function [binaryEdgeMaskImage] =  binaryEdgeMask(gradientMagnitudeImage)
    
    % we first test out the built-in gray threshhold, and then manually try which threshhold value is closed to desired output 
    
    %  threshhold = graythresh (gradientMagnitudeImage, 'concavity');
    %  binaryEdgeMask = im2bw(gradientMagnitudeImage, threshhold);
    
    threshhold = 0.04;
    
    image = gradientMagnitudeImage(:,:,1);
   
    binaryEdgeMask = image;
    binaryEdgeMask(image>0.04) = 1;
    binaryEdgeMask(image<0.04) = 0;

    binaryEdgeMaskImage = binaryEdgeMask;
    title_line = sprintf ('Binary Edge Mask, threshhold=%g', threshhold);
    subplot(1, 2, 2); imshow(binaryEdgeMaskImage, []); title(title_line);

    

    
end




