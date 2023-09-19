clear all; close all ; clc;
pkg load statistics;

N = 1000000;

U = randi([0 2] , 1 , N );
V = binornd(2, 0.5, 1, N);

X = U + V;
Y = U .* V;

u = 0 : 2;
v = 0 : 2;
x = 0 : 4;
y = 0 : 4;

pmfUV_sim = hist3([U' V'], {u ,v})/N
pmfUV_teo = [1 2 1; 1 2 1; 1 2 1]/12

pmfU_sim = hist(U,u)/N
pmfU_teo = [1/3 1/3 1/3]

pmfV_sim = hist(V,v)/N
pmfV_teo = [1/4 1/2 1/4]

pmfXY_sim = hist3([X' Y'], {x ,y})/N
pmfXY_teo = [ 1 0 0 0 0
              3 0 0 0 0
              2 2 0 0 0
              0 0 3 0 0
              0 0 0 0 1 ]/12
              
pmfX_sim = hist(X,x)/N
pmfX_teo = [ 1 3 4 3 1]/12

pmfY_sim = hist(Y,y)/N
pmfY_teo = [ 6 2 3 0 1]/12
