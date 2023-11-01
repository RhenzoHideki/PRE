clear all; close all ; clc;
pkg load statistics;

N = 10000000;

mu = [0;0;0]; % Vetor média
C = [ 3 3 0; 3 5 0; 0 0 6]; % Matriz covariaância

vetX = mvnrnd(mu, C, N);
X = vetX(:,1)';
Y = vetX(:,2)';
Z = vetX(:,3)';

% (a) Apenas f_{x,y}

dx = 0.1 ;x = -9: dx:9;
dy = 0.1 ;y = -9: dy:9;
[xx,yy] = meshgrid(x,y);

pdf_XY_sim = hist3([X' Y'], {x,y})/(N*dx*dy);
pdf_XY_teo = 1/sqrt((2*pi)^2 * 6) * ...
              exp(-0.5 * (5*xx.^2 - 6 .* xx .* yy + 3*yy.^2)/6); 

pdf_XY_teo = mvnpdf([xx(:) yy(:)],[0 0], [ 3 3 ; 3 5 ]);
pdf_XY_teo = reshape(pdf_XY_teo, length(x) , length(y));

figure; 
subplot(1,2,1); hold on ; grid on;
surf(xx,yy,pdf_XY_sim);
axis('square');
xlabel('x');ylabel('y');zlabel('f_{X,Y}(x,y)');

subplot(1,2,2)
surf(xx,yy,pdf_XY_teo);
axis('square');
xlabel('x');ylabel('y');zlabel('f_{X,Y}(x,y)');


%(b)
W = X + 2* Y - Z + 5;
dw = 0.5 ; w = -20 : dw : 30;
pdfW_sim = hist(W,w) / (N * dw );
pdfW_teo = 1/sqrt((2*pi*41)) * ...
              exp(-(w-5).^2/(2*41)); 
figure; hold on ; grid on;
bar(w,pdfW_sim,'r');
plot(w,pdfW_teo,'b','LineWidth',4);
xlabel('w');ylabel('f_W(w)');

% (c)

idx = 0.95 <= Y & Y <= 1.05;
Xcond = X(idx);
pdfXcond_sim = hist(Xcond,x)/(length(Xcond)*dx);
pdfXcond_teo = 1/sqrt(2*pi*6/5) * exp(-(x-3/5).^2 / (2*6/5));

figure; hold on; grid on;
bar(x,pdfXcond_sim,'r');
plot(x,pdfXcond_teo,'b','LineWidth',4);
xlabel('x');ylabel('f_X(x | Y=1');

%(d)

idx = 2.9 <= Z & Z <= 3.1;
Xcond = X(idx);
Pr_d_sim = mean( 0 <= Xcond & Xcond <= 1)
Pr_d_teo =  normcdf(1/sqrt(3)) - 0.5
