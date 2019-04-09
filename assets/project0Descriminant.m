function gx=project0Discriminant(xData,u,E,Pw)
%function gx=project0Discriminant(xData,u,E,Pw)
%Calculate the scalar discriminant gi(x) value for feature vector based on:
%xData : feature vector -- this is in column vector form
%u : mean vector (of wi)
%E : covariance matrix (of wi)
%Pw : prior probability for wi
%The '*wi' are the values determined for the specific feature from training
%data.  These do not change with new feature vectors. i=1..n where
%n is number of features.  There is one discriminant and call to this
%function for each dimension of the feature space.
%EE5650 UWyo Fall 2017 Matt Burkhart and Robel Girmatsion

%Error and boundary checks
%Check for colum vector xData and right size/orient for other args
%If dimensions do not agree the solution will error.

% This is a general implementation from Duda.  The specific discriminant
% gi(x) i=1..n depends on this function being passed the describing u, E,
% 
%Build and evaluate g(x) for all values of xData 
%xDataLength=length(xData)
%Set up descriptive variables and break full equation apart for readibility
S=size(xData);
xDataLength=S(2);
gx=zeros(1,xDataLength);
Einv=inv(E);
Edet=det(E);
%Step through each feature vector and determine the scalar of gi(x)
for i = 1 : xDataLength
x=xData(:,i); % Column vector form in the manner of Duda, et al.
a=(x-u.');
at=a.'; %Transpose a
% Calculate the terms of g1(x) and then sum them together
g1Xa=-0.5*(at*Einv*a);
g1Xb=0;  %g1Xb=-2/2*log(2*pi()); %Leave this out as it is independant of i
g1Xc=-0.5*log(Edet);
g1Xd=log(Pw);
gx(1,i)=g1Xa+g1Xb+g1Xc+g1Xd; %This is eq 49 from Duda 2006 2.6 -- a scalar
end
return;