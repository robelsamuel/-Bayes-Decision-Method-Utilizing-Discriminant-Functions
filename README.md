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
                                          
 Table 2. Table 1.  Statistical parameters for Project0 test data.  

 |    |  Prior Values | Mean Values | Covariance Matrices |
|:----------|:---------:|:--------:|------:|
|  class 1 | 0.75 | [0.0414   -0.0069]  |  [8.1074   -1.0368;  -1.0368    3.9351]  |          
|  class 2 | 0.25 |  [5.0081    7.9241]  | [6.0501     2.8475;   2.8475   11.2220]  |