## Copyright (C) 2021 jimmy
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} loadAndConvert (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: jimmy <jimmy@LAPTOP-GTB2R6KE>
## Created: 2021-04-22

function grayScaleImage = loadAndConvert (fileName)

  %loads and converts the image to a grayscaled image
  disp(fileName);
  originImage = imread(fileName);
    
  grayScaleImage = uint8(mean(rgb2gray(originImage), 3));
  
  figure(1), imshow(grayScaleImage);
  figure(2), imhist(grayScaleImage);
  
  #{
  Shortly describe the characteristics of the histogram: 
  Histogram is a graph showing the number of pixels in an image(y axis) at each different intensity value(x axis) found in that image.
  #}

endfunction
