function taskB(train_image, test1_img, test2_img, test3_img)
    
    
    % Task b 
    bin_train = im2bw(train_image, graythresh(train_image));
    
    figure; imshow(bin_train, []); title('binary mask');
    
    % load the test images
    bin_test1 = im2bw(test1_img, graythresh(test1_img));
    bin_test2 = im2bw(test2_img, graythresh(test2_img));
    bin_test3 = im2bw(test3_img, graythresh(test3_img));
 
    % Task c 
%    [values_train, Df_train] = makeFourierDescriptor(bmtrainB);
    % create train fourier descriptor
    cells = bwboundaries(bin_train);
    b = cells{1};
    Df_train = complex(b(:,2), b(:,1));
    Df_train = fft(Df_train);
    n = 24;
    Df_train = Df_train(1:(n+1));
    % normalize
    Df_train = Df_train(2:(n+1));
    Df_train = Df_train / abs(Df_train(1));
    Df_train = abs(Df_train);


    
    [valuesB1, img1descriptors] = makeFourierDescriptor(bin_test1);
    figure; 
    subplot(1, 3, 1), imshow(bin_test1); %imshow(bmtest1B);
    hold on
    for k = 1:length(img1descriptors)
        if norm(Df_train - img1descriptors(k,:)') < 0.06
            boundary = valuesB1{k};
            plot(boundary(:,2),  boundary(:,1), 'r', 'LineWidth', 2); 
        end
    end

    [valuesB2, img2descriptors] = makeFourierDescriptor(bin_test2);

    subplot(1, 3, 2), imshow(bin_test2); %imshow(bmtest2B);
    hold on

    for k = 1:length(img2descriptors)
        if norm(Df_train - img2descriptors(k, :)') < 0.06 
            boundary = valuesB2{k};
            plot(boundary(:,2),  boundary(:,1), 'r', 'LineWidth', 2); 
        end
    end
    hold off;

    [valuesB3, img3descriptors] = makeFourierDescriptor(bin_test3);
    subplot(1, 3, 3), imshow(bin_test3)
    hold on
    for k = 1:length(img3descriptors)
        if norm(Df_train - img3descriptors(k, :)') < 0.07 % we could not find the ampelmaennchen with 0.06 threshold
            boundary = valuesB3{k};
            plot(boundary(:,2),  boundary(:,1), 'r', 'LineWidth', 2); 
        end
    end
    hold off

%    D_f_train = getD_f(bin_train);
%    D_f_train = D_f_train(1:24); %this is D_f,train 
 
    % normalize training data
%    D_f = normalize(D_f_train)
 
 
 %TODO d)
 % for every D_f go over cells and compare with training data
 
 
end

function [B, descriptors] = makeFourierDescriptor(bm)
    % i. extract boundaries of binary mask
    B = bwboundaries(bm);
    % ii. number of elements for the descriptor
    m = length(B);
    n = 24; 
    descriptors = zeros(1, n);
    count = 1;
    
    for k = 1:size(B,1)
        boundary = B{k};
        Df = complex(boundary(:,2), boundary(:,1));
        Df = fft(Df);
        if size(Df, 1) > n
          % make translation, scale, rotation invariant
          Df = Df(1:(n+1));
          Df = Df(2:(size(Df)));
          Df = Df / abs(Df(1));
          Df = abs(Df);
          for i = 1:n
            descriptors(count, i) = Df(i);
          end
         else
          descriptors(count,:) = zeros(1,n);
        end
        count = count + 1;
    end
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