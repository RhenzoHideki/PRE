clear all; close all; clc;

N = 10000;  % Número de realizações
dt = 0.02; t = -1 : dt : 1;  % Vetor dos tempos

a = 1;
b = 2;
f0 = 1;

X = zeros(N, length(t));
for i = 1 : N
  THETA = 2 * pi * (rand() - 0.5);
  X(i, :) = a * cos(2*pi*f0*t - THETA) + b;
end

muX_sim = mean(X);
muX_teo = 2 * ones(size(t));

CX_sim = cov(X, X);
[T1, T2] = meshgrid(t, t);
CX_teo = 0.5 * a^2 * cos(2*pi*f0*(T2 - T1));

figure; grid on; hold on;
plot(t, X(1:1000, :))
ylim([-0.2, 3.2]);
xlabel('t'); ylabel('X(t)');

figure; grid on; hold on;
plot(t, muX_sim, 'mo', 'LineWidth', 6);
plot(t, muX_teo, 'b', 'LineWidth', 4);
ylim([-0.2, 2.2]);
title('Função média'); xlabel('t'); ylabel('\mu_X(t)');

figure;
subplot(1, 2, 1); grid on; hold on; view(30, 45);
surf(t, t, CX_teo);
shading flat;
title('Função autocovariância (teórica)'); xlabel('t_1'); ylabel('t_2'); zlabel('C_X(t_1, t_2)');
subplot(1, 2, 2); grid on; hold on; view(30, 45);
surf(t, t, CX_sim);
shading flat;
title('Função autocovariância (simulada)'); xlabel('t_1'); ylabel('t_2'); zlabel('C_X(t_1, t_2)');
