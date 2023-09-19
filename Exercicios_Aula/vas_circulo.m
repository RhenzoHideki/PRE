clear all; close all; clc;
pkg load statistics;

N = 10000;

dx = 0.05 ; x = -1.2: dx : 1.2;
dy = 0.05 ; y = -1.2: dy : 1.2;

X = zeros(1,N);
Y = zeros(1,N);

for i = 1: N
  do
    X(i) = 2*rand() - 1;
    Y(i) = 2*rand() - 1;
  until X(i)^2 + Y(i)^2 <= 1
end
 

figure; hold on ; grid on;
scatter(X,Y);
axis('square');


pdfXY_sim = hist3([X' Y'] , {x,y});
[ xx, yy] = meshgrid(x,y);
pdfXY_teo = (1/pi)*(xx.^2+yy.^2 <= 1);
view(45,30);
subplot(1,2,1);
surf(xx,yy,pdfXY_sim);
shading faceted;

subplot(1,2,2);
view(45,30)
surf(xx,yy,pdfXY_teo);

pdfX_sim = hist(X,x)/(N*dx);
pdfX_teo = (2/pi)*sqrt(1-x.^2).*(-1 <= x & x <=1);

figure; hold on;grid on;
bar(x,pdfX_sim,'y');
plot(x,pdfX_teo,'b','LineWidth',4);
