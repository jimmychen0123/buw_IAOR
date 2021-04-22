# Bauhaus University SoSe2021 IAOR Assignment 1
## Groip J Team members
Yen Lung Chen </br>
Martin </br>
Henrick </br>
## Topic
* Image enhancement
* Derivation of a binary mask by thresholding
* Refinement of the mask by using morphological operators
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


