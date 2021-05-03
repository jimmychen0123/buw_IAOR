function main()

% main function for assignment 2
pkg load image;
gray_image = loadAndConvert('img/ampelmaennchen.png');

%originalImage = imread(fileName);

GoG(gray_image);

end