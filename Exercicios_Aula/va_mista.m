clear all; close all; clc

N = 100000;

U = 4*rand(1, N);
idx1 = (U <=1);
idx2 = (U > 2);
X = zeros(1,N);
X(idx1) = 2*rand(1,sum(idx1));
X(idx2) = (rand(1,sum(idx2)) < 2/3);

dx = 0.0001; 
x = -1 : dx : 5 ;
pdfX_sim = hist(X,x)/(N*dx);

figure; hold on; grid on;
bar(x,pdfX_sim);