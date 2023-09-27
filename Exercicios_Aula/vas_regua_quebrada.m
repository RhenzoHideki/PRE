clear all; close all; clc;
pkg load statistics;
 
N = 100000;

dx = 0.01 ; x = -0.1:dx:1.1;
dy = 0.01; y = -0.1:dy:1.1;

X = rand(1 ,N);
for i = 1 : N
  Y(i) = X(i) * rand();
end

figure; hold on ; grid on;

scatter(X(1:5000),Y(1:5000));
axis('square');


[xx,yy] = meshgrid(x,y);

pdfXY_sim = hist3([X' Y'], {y,x})/(N*dx*dy);

pfdXY_teo = (1 ./ xx) .* ( 0 <= yy & ...
                           yy <= xx & ...
                           xx <= 1);
                           
figure; hold on; grid on;
subplot(1, 2, 1);
surf(xx, yy, pdfXY_sim);
view(45, 30);

xlabel('x'); ylabel('y'); zlabel('f_{X,Y}(x, y)');
subplot(1, 2, 2); hold on; grid on;
surf(xx, yy, pfdXY_teo);
view(45, 30);
xlabel('x'); ylabel('y'); zlabel('f_{X,Y}(x, y)');

covXY_sim = cov(X,Y);
covXY_teo = 1/24;

Pr_triangulo_teo = log(2) - 1/2
Pr_triangulo_sim = mean(Y < 1/2  & ...
                        X > 1/2 &  ...
                        X - Y < 1/2)