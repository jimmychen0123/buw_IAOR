
% Scripts contain executable code. They are basically the "main" programs. 

% By default installed packages are not available from the Octave prompt. The functions from a package should be added to the Octave path first
pkg load image;

fileName = input('Enter the file name inside single quotes: ');

grayScaleImage = loadAndConvert(fileName);
enhancedImage = enhanceContrast(grayScaleImage);
binaryImage = binary(enhancedImage);

morphologicalFilter(binaryImage);
