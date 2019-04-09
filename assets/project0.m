function project0()
%% Implement EE5650 (UW F17) Project 0
% function project0()
% A classifier based on discriminant functions that operates on
% two-dimensional feature and class data.
% This file requires the existance of two .MAT files
% training0.mat which contains the training data
% test0.mat which contains the test data
% No arguments are required to the function call
% EE5650 UWyo Fall 2017 Matt Burkhart and Robel Girmatsion
%% LOAD the data from a MATLAB data file.
% Data is stored in a structures with .class1 and .class2 data
trainingData=load('training0.mat')
testData=load('test0.mat')

% Transpose the data from the file from row vector feature data
% to column feature data so the equations in Duda, Hart & Stork (2006)
% can be implemented directly as they are presented for column features.
% i.e. x=[1;2;3] thus, x=fileData.'
c1TrainingData=trainingData.class1_train.';
c2TrainingData=trainingData.class2_train.';
c1TestData=testData.class1_test.';
c2TestData=testData.class2_test.';
% Data can be reassigned here to train and test the classifier as needed
c1Data=c1TrainingData; % We want to train the classifier w/ training data
c2Data=c2TrainingData; % We want to train the classifier w/ training data
%% PLOT histograms
% Plot the histograms of the feature values for class 1 and class 2 for
% the test and training data
% %**CLOSE ALL OPEN PLOT WINDOWS!!!** Be careful if other ML code is open.%
close('all','hidden');
%Features for class 1 training and test
%Setup the figure
fig1=figure('Name','Class 1: Histograms of Feature Values for Training and Test Data');
hold on;
fig1.Position=[20 50 600 600];
%Class 1 Feature 1 Training
subplot(2,2,1); %Top left subplot
histogram(trainingData.class1_train(:,1),100);
title('Feature x1 Training Data');
% Set limits and labels
xlim([-20 20]);
ylim([0 300]);
ylabel('Occurances');
xlabel('Feature Value');
%Class 1 Feature 1 Test
subplot(2,2,3); %Bottom left subplot
histogram(testData.class1_test(:,1),100);
% Set limits and labels
title('Feature x1 Test Data');
xlim([-20 20]);
ylim([0 300]);
ylabel('Occurances')
xlabel('Feature Value')
%Class 1 Feature 2 Training
subplot(2,2,2); %Top right subplot
histogram(trainingData.class1_train(:,2),100);
% Set limits and labels
title('Feature x2 Training Data');
xlim([-20 20]);
ylim([0 300]);
ylabel('Occurances')
xlabel('Feature Value')
%Class 1 Feature 2 Test
subplot(2,2,4); %Bottom right subplot
histogram(testData.class1_test(:,2),100);
% Set limits and labels
title('Feature x2 Test Data');
xlim([-20 20]);
ylim([0 300]);
ylabel('Occurances')
xlabel('Feature Value')
hold off

%Features for class 2 training and test
%Setup the figure
fig2=figure('Name','Class 2: Histograms of Feature Values for Training and Test Data')
hold on
fig2.Position=[70 100 600 600];
%Class 2 Feature 1 Training
subplot(2,2,1); %Top left subplot
histogram(trainingData.class2_train(:,1),100);
title('Feature x1 Training Data');
xlim([-20 20]);
ylim([0 100]);
ylabel('Occurances')
xlabel('Feature Value')
%Class 2 Feature 1 Test
subplot(2,2,3); %Bottom left subplot
histogram(testData.class2_test(:,1),100);
title('Feature x1 Test Data');
xlim([-20 20]);
ylim([0 100]);
ylabel('Occurances')
xlabel('Feature Value')
%Class 2 Feature 2 Training
subplot(2,2,2); %Top right subplot
histogram(trainingData.class2_train(:,2),100);
title('Feature x2 Training Data');
xlim([-20 20]);
ylim([0 100]);
ylabel('Occurances')
xlabel('Feature Value')
%Class 2 Feature 2 Test
subplot(2,2,4); %Bottom right subplot
histogram(testData.class2_test(:,2),100);
title('Feature x2 Test Data');
xlim([-20 20]);
ylim([0 100]);
ylabel('Occurances')
xlabel('Feature Value')
hold off

%% PLOT 2D scatter plots of the data
% A 2D MATLAB plot of all the feature training data points for class 1 & 2
fig3=figure('Name','Scatter plot of training data for class 1 (blue) and 2 (red)' );
hold on
fig3.Position=[120 150 600 600];
plot(c1Data(1,:),c1Data(2,:),'b.')
plot(c2Data(1,:),c2Data(2,:),'r.')
axis ([-20 20 -20 20])
ylabel('Feature x2')
xlabel('Feature x1')
text(-15,-15,'Class 1 = Blue','Color','blue','FontSize',14);
text(-15,-17,'Class 2 = Red','Color','red','FontSize',14);
% axis equal
hold off
%A 2D MATLAB plot of all the feature test data points for class 1 & 2
fig4=figure('Name','Scatter plot of test data for class 1 (blue) and 2 (red)' );
hold on
fig4.Position=[170 200 600 600];
plot(c1TestData(1,:),c1TestData(2,:),'b.')
plot(c2TestData(1,:),c2TestData(2,:),'r.')
axis ([-20 20 -20 20])
ylabel('Feature x2')
xlabel('Feature x1')
text(-15,-15,'Class 1 = Blue','Color','blue','FontSize',14);
text(-15,-17,'Class 2 = Red','Color','red','FontSize',14);
%axis equal
hold off

%% CALCULATE statistic on the data
%Determine some statistics for the data
c1Mean=mean(c1Data.');  % Mean using MATLAB function
c2Mean=mean(c2Data.'); % Mean using MATLAB function
c1Length=length(c1Data)
c2Length=length(c2Data)
Pw1=c1Length/(c1Length+c2Length) % Prior probability for class 1
Pw2=c2Length/(c1Length+c2Length) % Prior probability for class 2

%% DETERMINE covariance matrices
% Determine class 1 and class2 covariance matrices either by brute force
% or the cov() command. 
% The brute force method is based on Duda, et al. 2006 3.2.2 Eq. 19
% Covariance for class 1
C1=[]; %Temporary variable
C1sum=[0 0;0 0]; %Variable for running sum 2x2 based on expected dxd cov.
for i=1 : c1Length
    C1(:,i)= c1Data(:,i)-c1Mean.';
    C1=C1(:,i)*C1(:,i).';
    C1sum=C1sum + C1; % Sum the individual feature vector calculations
end
c1Cov=C1sum/c1Length; % Final calc for Duda Eq. 19.
c1CovML=cov(c1Data.') % Covariance using MATLAB functionality

% Covariance for class 2 using Duda Eq. 19
C2=[]; %Temporary variable
C2sum=[0 0;0 0]; %Variable for running sum 2x2 based on expected dxd cov.
for i=1 : c2Length
    C2(:,i)= c2Data(:,i)-c2Mean.';
    C2=C2(:,i)*C2(:,i).';
    C2sum=C2sum + C2; % Sum the individual feature vector calculations
end
c2Cov=C2sum/c2Length; % Final calc for Duda Eq. 19.
c2CovML=cov(c2Data.') % Using MATLAB functionality

% Determine inverse and determinant of the class covariance matrices
% Substitute *Cov with *CovML to use the MATLAB calculated covariance
c1CovInv=inv(c1Cov);
c2CovInv=inv(c2Cov);
c1CovDet=det(c1Cov);
c2CovDet=det(c2Cov);

%% SELECT data to be used for the decisions
% The discriminants have already been developed so they are set.  All that
% is done here is set the data for the decision process
c1Data=testData.class1_test.'; % Decide based on test data
c2Data=testData.class2_test.';
% c1Data=trainingData.class1_train.'; % Decide based on training data
% c2Data=trainingData.class2_train.';

%% CALCULATE and EVALUATE discriminants
%Implement the discriminant functions g1(X) and g2(X).
%These follow from Duda, et al. 2006 2.6 Eq. 49
%This method is followed rather than likelyhood-based decisions so that the
%code can be reused for future decisions and multi-dim feature space
%Each function is evaluated for the feature vector x1 and x2 for each class
%The discriminants can be compared here to determine class or stored and
%processed later to improve readability.  The discriminants yield a scalar
%for a given d-dimension colum feature vector.

%Evaluate g1(x) and g2(x) for all values of c1Data and c2Data then store
%the discriminant value plus the actual class represented for comparison
%Discriminant for class 1 evaluated for class 1
g1Xc1=project0Discriminant(c1Data,c1Mean,c1Cov,Pw1);
g1Xc1ActualClass=zeros(1,c1Length);

%Discriminant for class 2 evaluated for class 1
g2Xc1=project0Discriminant(c1Data,c2Mean,c2Cov,Pw2);
g2Xc1ActualClass=zeros(1,c1Length);

%Discriminant for class 1 evaluated for class 2
g1Xc2=project0Discriminant(c2Data,c1Mean,c1Cov,Pw1);
g1Xc2ActualClass=ones(1,c2Length);

%Discriminant for class 2 evaluated for class 2
g2Xc2=project0Discriminant(c2Data,c2Mean,c2Cov,Pw2);
g2Xc2ActualClass=ones(1,c2Length);

%% EVALUATE data to make a decision
%Now that we have the values for g1(x) and g2(x) for the features sampled
%in class 1 and 2, we can determine the class the feature vector represents
%Concatenate the g1(x) and g2(x) from class 1 with those from class 2
%such that we have g1(x) and g2(x) for the entire sample set.
%Do the same with the g1XClass(x) and g2XClass(x) so we have the true class
%from the data
% For all data
g1x=cat(2,g1Xc1,g1Xc2);
g2x=cat(2,g2Xc1,g2Xc2);
g1xclass=cat(2,g1Xc1ActualClass,g1Xc2ActualClass);
g2xclass=cat(2,g2Xc1ActualClass,g2Xc2ActualClass);
% To see performance stats for each a class, and decide only on that data
% For Class 1
% g1x=g1Xc1;
% g2x=g2Xc1;
% g1xclass=g1Xc1ActualClass;
% For Class 2
% g1x=g1Xc2;
% g2x=g2Xc2;
% g1xclass=g1Xc2ActualClass;

%Following from Duda 2.4.1 we will decide as follows:
%If g1(x) > g2(x) the x is in R1 and x is assigned to w1 (class 1)
%If the decision is made correctly, based on the training data, we score a
%1, if incorrect a zero.
% Use a decision function created for this project
[~,classPerform]=project0Decide(g1x,g2x,g1xclass);%Return classifier result

%% CALCULATE the performance
%How did the classifier do do...
decisionScore=classPerform; % Classifier results
successRate=sum(decisionScore)/length(decisionScore)*100 % Percent Correct
errorRate = 100-successRate % Percent Wrong

%% CALCULATE the decision boundary
%Display the boundary.  To do this, we could fit an equation to the line
%between R1 and R2 but that might take a great deal of effort.  A hint
%was given by Dr. Wright in class to show the difference in colors
%This can be done by creating a image/color map with axes for x1 and x2 and 
%assigning a color based on class 1 or 2.  x1 and x2 need to be bounded in
%a manner that reflects the values for the feature that are to be expected
%Bound the feature vector values to be evaluated
x1min=-20;
x1max=20;
x2min=-20;
x2max=20;
%Create an array with equally spaced values for testing and a reasonable
%number so the array in not inordinately large but still gives boundaries
%with reasonable resolution.
x1values=linspace(x1min,x1max,200); % 200 points between min and max
x2values=linspace(x2min,x2max,200);
%Now determine the region/class for each feature vector
%Preallocate the array with zeros
%This is a default of class1 for everything so we only have to replace if
%the feature corresponds to class2
regionMap=zeros(length(x1values),length(x2values)); 
%Loop through the values, creating a feature vector x based on values of x1
%and x2.  Using this feature vector, x, apply the discriminators and
%choose a class.
%When the region is R1/w1/class1 assign the regionMap a value of 0
%When the region is R2/w2/class2 assign the regionMap a value of 1
for i = 1:length(x1values)
    for j = 1:length(x2values)
    xFeatureVector=[x1values(i);x2values(j)]; % Build a feature vector
    % Evaluate the discriminant for each feature vector
    g1Xcx=project0Discriminant(xFeatureVector,c1Mean,c1Cov,Pw1);
    g2Xcx=project0Discriminant(xFeatureVector,c2Mean,c2Cov,Pw2);
     if g1Xcx > g2Xcx
     % This is short circuited so 0 is already decided if g1Xcx is greater.
     else regionMap(i,j)=1;  
     end
    end
end

%% PLOT the decision boundary and regions
% Use imagesc with a custom color map matched to two values (regions) of
% the decision space.
fig5=figure('Name','Decision Boundary and Regions for Features x1 & x2')
hold on
fig5.Position=[220 250 600 600];
imagesc(regionMap); % This plots the data
% Adjust the axes
set(gca,'Ydir','normal')
%axis('equal');
set(gca,'xtick',[0,100,200])
set(gca,'xticklabel',{'-20','0','20'})
set(gca,'ytick',[1,100,200])
set(gca,'yticklabel',{'-20','0','20'})
ylabel('Feature x2')
xlabel('Feature x1')
text(20,50,'R2');
text(100,50,'R1');
text(170,150,'R2');
% Color the image to show the boundaries
colormap([1 0 0;0 0 1]); %Create binary red and blue color map: 0=rd, 1=bl
hold off
% Generate the contour plot by obtaining the histogram for features 1 & 2
% for the given class.  This will give the Z values for the contour plot.
[Nc1f1,edges]=histcounts(testData.class1_test(:,1),40);
[Nc1f2,edges]=histcounts(testData.class1_test(:,2),40);
[Nc2f1,edges]=histcounts(testData.class2_test(:,1),40);
[Nc2f2,edges]=histcounts(testData.class2_test(:,2),40);
% Determine the lengths of the histogram columns and build an array that
% can be used with countour() to generate the plots.

%% CLEAN up the display and orders of the features
%Display the figures in a nice cascaded order by setting the current figure
figure(fig4);
figure(fig3);
figure(fig2);
figure(fig1);

return;
