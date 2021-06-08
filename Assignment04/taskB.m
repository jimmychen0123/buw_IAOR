function [D_f_train] = taskB(train_image, test1_img, test2_img, test3_img)
    
    % Task b 
    bin_train = im2bw(train_image, graythresh(train_image));
    
    figure; imshow(bin_train, []); title('binary mask');
    
    % load the test images
    bin_test1 = im2bw(test1_img, graythresh(test1_img));
    bin_test2 = im2bw(test2_img, graythresh(test2_img));
    bin_test3 = im2bw(test3_img, graythresh(test3_img));
 
 D_f_train = getD_f(bin_train);
 D_f_train = D_f_train(1:24); %this is D_f,train 
 
 % normalize training data
 D_f = normalize(D_f_train)
 
 
 %TODO d)
 % for every D_f go over cells and compare with training data
 
 
end

% function to normalize one object (so one cell of the k detected boundaries)
function [norm] = normalize(d_f)
    norm = d_f;
    % translate: f(1) = 0
    d_f(1) = 0;
    for i = 1:size(d_f)
        % fft(D_f)
        d_f(i) = fft(d_f(i));
        % radius: for every element: divide by abs(f(1))
        norm(i) = d_f(i)/abs(d_f(2));
        % rotationfor every element: take absolute value
        norm(i) = abs(d_f(i));
    end
end

function [D] = getD_f(bin_img)
 %m x 2 array:
 boundaries = bwboundaries(bin_img);
 
 b = cell2mat(boundaries);
 %build complex vector D   to get complex i use: 1i
 D = b(:,2)+1i*b(:,1);
  
 % shape generalization (I hope this is correct)
 
end