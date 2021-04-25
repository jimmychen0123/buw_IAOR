# Bauhaus University SoSe2021 IAOR Assignment 1
## Groip J Team members
Yen Lung Chen </br>
Martin 119982</br>
Henrik </br>
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
Why did we decide to use which structure element?

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

Especially why did we use a the SE that big or small? Lets compare different results.
