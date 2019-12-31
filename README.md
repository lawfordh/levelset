# levelset
# This program performs the algorithm detailed in "Active countours without edges" by Chan and Vese, 2001. 
# To run on an image I, use the function Final2 with the following syntax:
#       [ImageWithContour,InsideImage,OutsideImage,FinalPhiFunction] = Final2(I). 
# To adjust the weight of the contour length in the algorithm, change the value assigned to "mu" in line 3 of Final2.
# To adjust the number of iterations in the algorithm, change the value assigned to "iterations" in line 4 of Final2.
# The program will also create a video titled "segmentation.avi" of the contour evolution. 
