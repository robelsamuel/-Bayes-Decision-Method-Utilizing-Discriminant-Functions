# Linear-Discriminant-Classification Using MATLAB  
## Abstract: 

Actions based on the decision of categorizing an item, described by a sensed set of features, as belonging to one class or another are critical to the implementation of machine learning and autonomous systems.  This investigation utilizes a given set of training data in a supervisory manner to develop and train a discriminant-based dichotomizer.  The subject data provided represents two classes described by a twodimensional feature space.  Visualization of the supplied data is conducted and statistical parameters of the training data are calculated and used to develop the discriminant equation based classifier.  Finally, the classifier is applied to a given set of test data and the performance is discussed along with presentation of decision regions mapped onto a representative feature space.

## Interpretation of the Data
Visual observation of the data was conducted using MATLAB functionality for histograms and scatter plots.  The 2-dimensional feature values are stored in provided .MAT training and test data files as column vectors.  First, the training data was loaded and then transposed into a row vector such that it can be directly calculated in the equations given in Duda. In the project code, c1Data and c2Data are the variable names given to the transposed raw vectors.  c1Data and c2Data can be assigned to the correct input data as needed.  The MATLAB code plotted the histogram and scatter data for visual interpretation and calculated the means and covariances for the discriminants. 

The basic statistical information including the prior probability, mean and covariance of the training data for Project 0 is summarized in Table 1.  Table 2 contains the relevant parameters for the test data

Table 1.  Statistical parameters for Project0 training data.

|    |  Prior Values | Mean Values | Covariance Matrices |
|:----------|:---------:|:--------:|------:|
|  class 1 | 0.75 | [-0.0056   -0.0293] |    [7.8510    -1.1144;-1.1144    4.0218] |          
|  class 2 | 0.25 |  [4.9893    7.9729] |    [5.8559    2.8060; 2.8060   11.7088]  |
                                          
 Table 2. Statistical parameters for Project0 test data.  

 |    |  Prior Values | Mean Values | Covariance Matrices |
|:----------|:---------:|:--------:|------:|
|  class 1 | 0.75 | [0.0414   -0.0069]  |  [8.1074   -1.0368;  -1.0368    3.9351]  |          
|  class 2 | 0.25 |  [5.0081    7.9241]  | [6.0501     2.8475;   2.8475   11.2220]  |

## Scatter plots of both training and test data

Scatter plots were obtained using MATLAB for the training and test data supplied for the project.  Figure 1 shows the plotted training data on the 2-D x1 and x2 feature space.  Cursory observations show that Class one may have less variance than Class 2.  This could also be due to the number of data points being different for each class.  The feature values of Class 1 appear to show a dependence on one another with the major and minor axis defining and ellipse for feature x1 that is slightly off perpendicular from the ellipse formed by the feature values for class 2.  The covariance of the data will show this interdependence.  The classes are overlapped for some of the data.  This overlap affects the classifier performance and implies that we will not be able to get 0 % error on the classification for a two dimensional system. 

Figure 1.  Scatter plot of the features values for Class 1 and 2 contained in the training data.

![ScatterPlots_Training_data](https://user-images.githubusercontent.com/14088523/55841889-58338b00-5aee-11e9-8a97-71cffbb864fb.PNG)

Figure 2.  Scatter plot of the features values for Class 1 and 2 contained in the test data.

![ScatterPlots_Test_data](https://user-images.githubusercontent.com/14088523/55841888-58338b00-5aee-11e9-9287-01c6494ee4b2.PNG) 

## 1-D Histogram plots of the Data features

The 1-D histograms will show that the tails of the Gaussians for the x1 and x2 features for both classes overlap.  Figure 2 shows the plotted test data on the 2-D x1 and x2 feature space.  Similar characteristics were noted about the test data. 
 
Figure 3.  1-D Histograms showing Gaussian distributions of Class 1 feature values for training and test data.

![1_D Histogram-Gaussian_dis_class1_TraningandTest_Data](https://user-images.githubusercontent.com/14088523/55841884-579af480-5aee-11e9-9603-bdeb91118876.PNG)

Figure 4.  1-D Histograms showing Gaussian distributions of Class 2 feature values for training and test data.

![1_D Histogram-Gaussian_dis_class2_TraningandTest_Data](https://user-images.githubusercontent.com/14088523/55841886-579af480-5aee-11e9-915a-da17472c25aa.PNG)

## Classifier Peroformance

The discriminants evaluated for a specific feature vector must be compared directly according to the Bayes decision rule, 

                Classify x as w1 (class1) if g1 (x)  >  g2 (x) else as W2 (class2)  

 To enable the comparison, discriminant equations must evaluate to a scalar for a given feature vector and,thus, maintaining the proper vector orientation is crucial.  Recognizing this, input data for classification should be observed and transformed if needed as the sensing, separation and extraction steps may not always provide data in the anticipated form. The implementation of the discriminants based on the training data yields Figure 5, a graph of the decision regions for each of the classes, evaluated for a representative selection of feature vectors.  R1 denotes a region for which the combined values of features 1 and 2 will decide Class 1.  Likewise, R2 denotes regions for which the combined values of feature 1 and 2 will decide Class 2.  To generate Figure 5 and depict the decision boundaries, the two discriminants, g1(x) and g2(x) were evaluated for feature x1 and x2 values that encompassed the minimum and maximum values seen in the test data with incremental values fine enough to show the characteristic curves.  It can be seen that the decision regions are not simply connected. 
 
Figure 5. Decision regions and boundaries for the discriminants developed from the training data. 

![Decision_regions_and_boundaries_for_the_discriminants_developed_Trainig_Data](https://user-images.githubusercontent.com/14088523/55841887-58338b00-5aee-11e9-9760-c50563b41a07.PNG)

The overall performance of the simple discriminant classifier presented here is encouraging.  The results of the classification are given in Table 2 for the training and test data.  A good check of the initial performance and suitability of the classifier is to test the classifier on the training data.  Large errors may indicate error in the algorithm or the need to include a larger feature space.  Interestingly, the test data was slightly more accurately classified than the training data. 

Table 3.  2-D classifier (dichotomizer) results for training and test data*. 

|Data Source| Class 1| Class 2 |Overall |
|:------|:----:|:----:|------:|
|       | % Success -  % Error  | %Success - % Error |% Success - % Error|
|Training | 98.85% - 1.15% | 91.36% - 8.64% | 96.98% - 3.02% |
|Test | 98.91% - 1.09% | 91.84% - 8.16% | 97.14%  - 2.86% |