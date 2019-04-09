function [classDecide, classPerform]=project0Decide(g1x,g2x,correctClass)
%function [classDecide, classPerform]=project0Decide(g1x,g2x,correctClass)
%Make a decision of class based on the value of two disciminant functions
%classDecide : Returned vector indicating decided class based on g1 and g2
%        0 indicates class 1 and 1 indicates class 2, to assist in summing
%        the vector to obtain performance stats.
%classPerform : Returned vector indicating if the correct correct class
%        was chosen based on the correct class from the data associated w/
%        the feature vector data, 0=no 1=yes, this assists in determining
%        performance of the classifier   
%g1x : vector of discriminant values based on the equation from class 1
%g2x : vector of discriminant values based on the equation from class 2
%correctClass : vector indicating the correct value for the feature vector
%EE5650 UWyo Fall 2017 Matt Burkhart and Robel Girmatsion

%Boundary and error checks
% Add checks for g1x, g2x and correctClass to have the same length
% if  not length(g1x) and length(g2x) and length(correctClass) then exit

%Following from Duda 2.4.1 we will decide as follows:
%If g1(x) > g2(x) the x is in R1 and x is assigned to w1 (class 1)
%For simplicity with matrix allocation (zeros), class 1 = 0 and c2 =1
%pre allocate the class aray which holds the decision results
%Data is all the same length so the use of a variable length is arbitray
classDecide=zeros(1,length(g1x)); %Zero filled initial array for results
classPerform=zeros(1,length(g1x)); % Zero filled array for real vs decide
%Run through the values from the discriminanats whihc were evaluated at the
%feature vectors of interest and make a decision on class represented
for i = 1 : length(g1x)
    if g1x(i) > g2x(i) %This is it, the decision logic!
        % Short circuit loop as array already contains 0 for this case
        %class(i)=0; %Feature vector describes class 1, 0 is already stored
        tempClass=0; % Decide Class 1
    else
        classDecide(i)=1; %Feature vector describes class 2
        tempClass=1; % Decide Class 2
    end
    if tempClass == correctClass(i) % Did this decision match real class?
        classPerform(i)=1;
    end        
end
% size(classPerform) %Double check final arary size, should match input
return
