%*8.* Considere o processo estocástico
%$X(t) = A "rect"(t-2) + B"rect"(t-3/2)$ onde A e B são variáveis aleatórias independentes, ambas uniformemente distribuídas sobre o intervalo real [0,4].
%(a) Determine e esboce três possíveis realizações (funções-amostra) do processo, à sua escolha.
%(b) Determine e esboce a função média de $X(t)$.
%(c) Determine a função autocovariância de $X(t)$.

close all; clear all; clc;

N = 10000;  % Número de experimentos probabilísticos
dt = 0.01;  % Passo do tempo
t = -5: dt :5;
t1 = t;
t2 = t;
Nt = length(t);


%(a) Determine e esboce três possíveis realizações (funções-amostra) do processo, à sua escolha.
% A = 0 e B = 0
A0 = 0;
B0 = 0;
A0B0 = A0 * (0 <= t & t < 1) + ...
       B0 * (1 <= t & t < 2);

figure; grid on; hold on;
plot(t, A0B0, 'b', 'LineWidth', 2);
title('Função-Amostra A = 0, B = 0');
xlabel('t'); ylabel('X(t)');
ylim([0 1.2]);
xlim([-0.5 4]);

% A = 1 e B = 0

A1 = 1;

A1B0 = A1 * (0 <= t & t < 1) + ...
       B0 * (1 <= t & t < 2);
figure;
plot(t, A1B0, 'b', 'LineWidth', 2);
title('Função-Amostra A = 1, B = 0');
xlabel('t'); ylabel('X(t)');
ylim([0 1.2]);
xlim([-0.5 4]);


% A = 1 e B = 1

B1 = 1;

A1B1 = A1 * (0 <= t & t < 1) + ...
       B1 * (1 <= t & t < 2);
figure;
plot(t, A1B1, 'b', 'LineWidth', 2);
title('Função-Amostra A = 1, B = 1');
xlabel('t'); ylabel('X(t)');
ylim([0 1.2]);
xlim([-0.5 4]);

%(b) Determine e esboce a função média de $X(t)$.
X = zeros(N, Nt);
for i = 1 : N
  A = rand() * 4;
  B = rand() * 4;
  
  X(i, :) = A * (0 <= t & t < 1) + ...
            B * (1 <= t & t < 2);
end

muX_sim = mean(X);
muX_teo = 2 * (0 <= t & t < 2);

figure; grid on; hold on;
plot(t, muX_sim, 'b', 'LineWidth', 4);
plot(t, muX_teo, 'b--', 'LineWidth', 2);
title('Função média'); xlabel('t'); ylabel('\mu_X(t)');


% c) Função autocovariância

CX_sim = cov(X, X);
[T1, T2] = meshgrid(t1, t2);
CX_teo = 16/3 .* ((0 <= T1 & T1 < 1) .* (0 <= T2 & T2 < 1)  + ...
                  (1 <= T1 & T1 < 2) .* (1 <= T2 & T2 < 2)) + ...
         4    .* ((0 <= T1 & T1 < 1) .* (1 <= T2 & T2 < 2)  + ...
                  (1 <= T1 & T1 < 2) .* (0 <= T2 & T2 < 1)) - ...
         4    .*  (0 <= T1 & T1 < 2) .* (0 <= T2 & T2 < 2);

figure;
subplot(1, 2, 1); grid on; hold on; view(30, 45);
surf(t1, t2, CX_sim);
shading flat;
title('Função autocovariância (simulada)'); xlabel('t_1'); ylabel('t_2'); zlabel('C_X(t_1, t_2)');

subplot(1, 2, 2); grid on; hold on; view(30, 45);
surf(t1, t2, CX_teo);
shading flat;
title('Função autocovariância (teórica)'); xlabel('t_1'); ylabel('t_2'); zlabel('C_X(t_1, t_2)');
