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
N = 1000000;  % Número de realizações

X1 = rand(1, N) < 1/3;
X2 = rand(1, N) < 1/3;
X3 = rand(1, N) < 1/3;

Y1 = X1 .* X2
Y1 = X2 .* X3
Y1 = X1 .* X3