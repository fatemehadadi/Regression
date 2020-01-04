close all;
clear all;
clc;
 
%Example of Data
A=[ -1.2 , 0.9 , 5.6 , 4.6 , 5.3 , 2.4 , -2.9 , 0.76 , -4 , 1.9 ...
    ; 1.7 , 0.9 , 8 , 4.7 , 7 , 3.1 , -1.6 , 1 , -5 , 2]

%Make It Zero Center
A=A-mean(A,2)*ones(1,10);

%Covariance Matrix
C=A*A'/9;

%plot the Example Data
figure;
plot(A(1,:)',A(2,:)','.','MarkerSize',15);
axis([-15 15 -15 15]);


%% svd decomposition of first row and covariance matrix
[U,S,V]=svd(A(1,:)','econ');
[u,s,v]=svd(C^0.5);

X=linspace(-15,15) %set the line space for plot
b=V*inv(S)*U'*A(2,:)'; %find the regression by pseudoinverse and SVD of fisrt row
c=u(1,2)/u(1,1); %find the regression by SVD of covariance matrix

%draw regression line
figure;
plot(A(1,:)',A(2,:)','.','MarkerSize',15)
axis([-15 15 -15 15]);
hold on
line(X,b*X,'Color','black')
line(X,c*X,'Color','red');
hold off
