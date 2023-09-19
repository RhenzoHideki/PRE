clear all; close all; clc;
N = 100000; % Numero de iterações

X = rand(1, N);
Y = X.^2;

dx = 0.03; x= -0.2: dx : 1.2;
dy = 0.01; y= -0.2: dy :1.2;

pdfX_teo = (0<= x & x <= 1);
pdfX_sim = hist(X,x) / (N* dx);

pdfY_teo = (0.5 ./ sqrt(x)).*(0<= x & x <= 1);
pdfY_sim = hist(Y,y) / (N* dy);


figure;
subplot(1,2,1); hold on; grid on;
bar(x,pdfX_sim,'r');
plot(x,pdfX_teo,'b','LineWidth',3);

subplot(1,2,2); hold on; grid on;
bar(y,pdfY_sim,'r');
plot(y,pdfY_teo,'b','LineWidth',3);

%EX_teo = 1/2
%EX_sim = mean(X)

%EY_teo = 1/3
%EY_sim = mean(Y)