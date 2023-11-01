clc; clear all; close all;

N = 1000000;

mu = 5;
sigma = 4;


X = sigma*randn(1,N) + mu;

dx = 0.05;
x = -5*sigma + mu : dx : 5*sigma +mu;


pdfX_sim = hist(X,x)/(N*dx);
pdfX_teo = 1 / sqrt(2*pi*sigma^2) * exp(-(x - mu).^2 / (2*sigma^2) );

figure; hold on ; grid on;
bar(x,pdfX_sim,'r');
plot(x,pdfX_teo,'b',"LineWidth",4)