#* 10. *  Sejam $X_1, X_2, X_3 ∼ "Bern"(1/3)$ variáveis aleatórias sorteadas independentemente.
#(a) Sejam
##$ Y_1 = X_1 X_2, $
##$ Y_2 = X_2 X_3, $
##$ Y_3 = X_3 X_1. $
##Determine o vetor média e a matriz covariância do $"vetor aleatório" ->
#Y = [Y_1 Y_2 Y_3]^T $.
#(b) Sejam
#$ Z_1 = Y_1 + Y_2, $
#$ Z_2 = Y_2 + Y_3, $
#$ Z_3 = Y_3 + Y_1. $
#Determine o vetor média e a matriz covariância do $"vetor aleatório" ->
#Z = [Z_1 Z_2 Z_3]^T $. Utilize a formulação matricial.

close all; clear all ; clc;

N = 10000000;  % Número de realizações

X1 = rand(1, N) < 1/3;
X2 = rand(1, N) < 1/3;
X3 = rand(1, N) < 1/3;

Y1 = X1 .* X2;
Y2 = X2 .* X3;
Y3 = X1 .* X3;

muY_sim = mean([Y1' Y2' Y3'])'
muY_teo = [1/9 ; 1/9 ; 1/9]

covY_sim = cov([Y1' Y2' Y3'])
covY_teo = [8/81 2/81 2/81
            2/81 8/81 2/81
            2/81 2/81 8/81]

Z1 = Y1 + Y2;
Z2 = Y2 + Y3;
Z3 = Y3 + Y1;
muY_sim = mean([Z1' Z2' Z3'])'
muY_teo = [2/9 ; 2/9 ; 2/9]

covY_sim = cov([Z1' Z2' Z3'])
covY_teo = [20/81,14/81,14/81;
            14/81,20/81,14/81;
            14/81,14/81,20/81]
