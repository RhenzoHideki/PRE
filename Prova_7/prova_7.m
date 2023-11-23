%6. Considere dois processos de Poisson, $X_1 (t)$ e $X_2 (t)$, independentes, de taxas $lambda_1 = 2$ e $lambda_2 = 2,5$ eventos/s, respectivamente. Seja $X(t) = X_1 (t) + X_2 (t)$. As questões abaixo são todas referentes ao processo estocástico $X(t)$
%(a) Determine e esboce a função média do processo estocástico.
%(b) Determine a probabilidade de ocorrer pelo menos quinze eventos entre 6 e 9s , dados que ocorreu um evento entra 10 e 13s.
%(c) Determine a probabilidade de que o tempo decorrido entre o segundo evento e o terceiro evento seja maior que 0,1s
%(d) Determine a matriz covariância do vetor aleatório $[X(4) X(3)]^T$

close all; clear all; clc;
pkg load statistics;

N = 10000; % Numero de experimentos
dt = 0.005;
t = 0 : dt : 20;
Nt = length(t);
lambda1 = 2;
lambda2 = 2.5;
lambda = lambda1 + lambda2;

%(a) Determine e esboce a função média do processo estocástico.
X = zeros(N,Nt);

for i = 1 : N
    T = 0;
    while T < t(end)
        T = T + exprnd(1/lambda);
        X(i,:) += (t > T);
    endwhile
endfor

muX_sim = mean(X);
muX_teo = lambda * t .*(t>=0);

figure; hold on; grid on;
plot(t, muX_sim, 'y', 'LineWidth', 4);
plot(t, muX_teo, 'b', 'LineWidth', 2);

%(b) Determine a probabilidade de ocorrer pelo menos quinze eventos entre 6 e 9s , dados que ocorreu um evento entra 10 e 13s.
% Pr[X6,9 >= 15 | X10,14 = 1]
idx6 = (6/dt)+1;
idx9 = (9/dt)+1;

X6 = X(:,idx6);
X9 = X(:,idx9);

PrX69_maior_3_sim = mean(X9 - X6  >= 15)
PrX69_maior_3_teo = 0.282207

%(c) Determine a probabilidade de que o tempo decorrido entre o segundo evento e o terceiro evento seja maior que 0,1s
% Pr[Δ3 > 0,1]
% c) Pr[Δ6 > 1]

T = diff(X')';

T3 = zeros(1, N);
T2 = zeros(1, N);
for i = 1 : size(T, 1)
    row = T(i, :);
    indices = find(row);

    T3(i) = (indices(3) - 1) * dt;
    T2(i) = (indices(2) - 1) * dt;
end;

delta3_sim = mean((T3 - T2) > 0.1)
delta3_teo = 0.6376

%(d) Determine a matriz covariância do vetor aleatório $[X(4) X(3)]^T$
idx4 = (4 / dt) + 1;
X4 = X(:, idx4);

idx3 = (3 / dt) + 1;
X3 = X(:, idx3);

Cx_sim = [cov(X4, X4) cov(X4, X3);
        cov(X4, X3) cov(X3, X3)]

Cx_teo = [18 13.5;
          13.5 13.5]
