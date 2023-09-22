clear all; close all; clc;


N = 100000;

X = rand(1 ,N);
for i = 1 : N
  Y(i) = X(i) * rand();
end

figure; hold on ; grid on;

scatter(X(1:5000),Y(1:5000));
axis('square');

covXY_sim = cov(X,Y);