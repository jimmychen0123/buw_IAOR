# Bauhaus University SoSe2021 IAOR Assignment 1
## Groip J Team members
Yen Lung Chen </br>
Martin 119982</br>
Henrik Leisdon, 118334</br>
## Topic
* Image enhancement
* Derivation of a binary mask by thresholding
* Refinement of the mask by using morphological operators
##Task A

### Shortly describe the characteristics of the histogram
Histogram is a graph showing the number of pixels in an image(y axis) at each different intensity value(x axis) found in that image.
Figure 1:

![histogram](https://user-images.githubusercontent.com/39960241/115700026-8fd49f00-a366-11eb-9840-db4ae003fcbe.jpg)

Figure 2: actual image corresponding to the histogram of figure 1:
![input_sat_image](https://user-images.githubusercontent.com/39960241/115700910-80098a80-a367-11eb-8cc2-1180358b52ca.jpg)

### Shortly describe the differences to the initial histogram after enhancement
The figure 1 shows a low-contrast image as the the values of x axis in intensity hitogram are only distrbuted in a certain range. To improve the visual quality of the image, One technique of image enhancement is contrast stretching on histogram where the image has to use the full intensity range to display the maximum contrast. Contrast stretching takes an image in which the intensity values span the full intensity range as the figure 3 and 4 shown. 

Figure 3:

![enhancementHistogram](https://user-images.githubusercontent.com/39960241/115701181-cfe85180-a367-11eb-8f5d-32471cbe1fcb.jpg)

Figure 4:

![enhancedImage](https://user-images.githubusercontent.com/39960241/115701343-fc03d280-a367-11eb-9595-d579483f65f2.jpg)

## Task B

### Different tresholds
The resulting treshold by graytresh is 0.4353
When we set a manuel treshold of 30, there is a highlighted spot in the bottom center of the image
![treshold_30](https://github.com/henrik-leisdon/buw_IAOR/blob/20cfede4e657713343a9bfb117d0e4f9333fcb0b/img/treshold_0_30.jpg)
Therefore we compared the treshold of 0.4 and 0.5 
![treshold_40](https://github.com/henrik-leisdon/buw_IAOR/blob/20cfede4e657713343a9bfb117d0e4f9333fcb0b/img/treshold_0_40.jpg)
![treshold_50](https://github.com/henrik-leisdon/buw_IAOR/blob/20cfede4e657713343a9bfb117d0e4f9333fcb0b/img/treshold_0_50.jpg)
Because the  spot in the river is so bright, that if the treshold is to high, the rest of the city is also in the region of interest (ROI). When the treshold is too low, not the whole river is in the ROI. Therefore we decided to use the resulting treshold of the function `graytresh`.

### Different grayTreshOptions
Also we tried different algorithms of the `graytresh`-function
![Otsu](https://github.com/henrik-leisdon/buw_IAOR/blob/20cfede4e657713343a9bfb117d0e4f9333fcb0b/img/Otsu.jpg)
![mean](https://github.com/henrik-leisdon/buw_IAOR/blob/20cfede4e657713343a9bfb117d0e4f9333fcb0b/img/mean.jpg)
![moments](https://github.com/henrik-leisdon/buw_IAOR/blob/20cfede4e657713343a9bfb117d0e4f9333fcb0b/img/moments.jpg)
By comparing these images we decided to use the Otsu algorithm, because the ROI fitted the best for our needs.

## Task C
### Why did we decide to diamond structure element?
Since structuring element would greatly affect the edge of the ROI with an urban bird-view image given, we found better result and perception with diamond structure element. 

![finalOverlay](https://user-images.githubusercontent.com/39960241/116009590-ce927f80-a61a-11eb-9028-e06dfe1ae124.jpg)

```
  0  0  0  0  0  1  0  0  0  0  0
  0  0  0  0  1  1  1  0  0  0  0
  0  0  0  1  1  1  1  1  0  0  0
  0  0  1  1  1  1  1  1  1  0  0
  0  1  1  1  1  1  1  1  1  1  0
  1  1  1  1  1  1  1  1  1  1  1
  0  1  1  1  1  1  1  1  1  1  0
  0  0  1  1  1  1  1  1  1  0  0
  0  0  0  1  1  1  1  1  0  0  0
  0  0  0  0  1  1  1  0  0  0  0
  0  0  0  0  0  1  0  0  0  0  0
```
![finalOverlayWithDisk](https://user-images.githubusercontent.com/39960241/116009695-64c6a580-a61b-11eb-9be3-569aa6ba2380.jpg)

```
  0  0  0  0  0  1  0  0  0  0  0
  0  0  1  1  1  1  1  1  1  0  0
  0  1  1  1  1  1  1  1  1  1  0
  0  1  1  1  1  1  1  1  1  1  0
  0  1  1  1  1  1  1  1  1  1  0
  1  1  1  1  1  1  1  1  1  1  1
  0  1  1  1  1  1  1  1  1  1  0
  0  1  1  1  1  1  1  1  1  1  0
  0  1  1  1  1  1  1  1  1  1  0
  0  0  1  1  1  1  1  1  1  0  0
  0  0  0  0  0  1  0  0  0  0  0
```

### Effect of the size of structuring element
The bigger the structuring element is, less details of ROI or noises can be revealed.
### Are the results satisfactory? What are the limitations of this approach for separating background and foreground?
Overall we were happy with the result, most of the ROI(the river) was revealed. However there are areas of urban location were taken as ROI, one of the limitations of morphological filter approach is that it require trail-and-error step to have desired outcome.

### Significant difference with respect to quality of the results for the different input images?

![secondImage](https://user-images.githubusercontent.com/39960241/116010437-35199c80-a61f-11eb-922e-cfca10c05c15.jpg)

![secondImageFinalOverlay](https://user-images.githubusercontent.com/39960241/116010439-3ea30480-a61f-11eb-9d0a-b8f8b5fba088.jpg)

In the second input image we are interested in the fields, and without changing the variables the accuracy of ROI is reduced.


source image1: https://i.pinimg.com/originals/bc/91/af/bc91af8974e84b7e4897eb52b8ddd3ec.jpg
source image2: https://c0.wallpaperflare.com/preview/1003/50/552/bird-s-eye-view-photography-of-river-in-city.jpg

In the third we are interested in the water.
But due to the different water colors (light and shadow) and the similarities between the foreground and background for the algorithm it is very hard to evaluate. 
![firstImageTaksF](https://github.com/henrik-leisdon/buw_IAOR/blob/16818f5c02d2ae1437aa297a53f92b9d8e40f480/image1.jpg)

After inversion, the water/our foreground is detected in the most parts of the image but, in the shadow areas at the top and bottom of the water and also at the transition between foreground and background there are no clear edges.
COMMENT to me (henrik): add the final images instead of the binary!!! 
![firstBinaryImageTaskF](https://github.com/henrik-leisdon/buw_IAOR/blob/16818f5c02d2ae1437aa297a53f92b9d8e40f480/binaryImage1.jpg) 

In the fourth image we are gain interested in the water.
Here it is a bit clearer because the color difference between the foreground and background is more clear.
![secondImageTaksF](https://github.com/henrik-leisdon/buw_IAOR/blob/16818f5c02d2ae1437aa297a53f92b9d8e40f480/image2.jpg)

But again the difference between blue and green is really hard to distinguish.
COMMENT to me (henrik): add the final images instead of the binary!!! 
![secondBinaryImageTaksF](https://github.com/henrik-leisdon/buw_IAOR/blob/16818f5c02d2ae1437aa297a53f92b9d8e40f480/binaryImage2.jpg)