clear all; close all; clc;

N = 10000;  % Número de realizações
dt = 0.5; t = -5 : dt : 20;  % Vetor dos tempos
x = -3 : 3;

X = zeros(N, length(t));
for i = 1 : N
  A = 2*randi([0 1]) - 1;
  B = 2*randi([0 1]) - 1;
  X(i, :) = A * (0 <= t & t < 10) + B * (5 <= t & t < 15);
end

t0 = 8.5;
idx = round((t0 - t(1)) / dt) + 1;
pmfX_sim = hist(X(:, idx), x) / N;

if (0 < t0 && t0 <= 5) || (10 < t0 && t0 < 15)
  pmfX_teo = [0 0 0.5 0 0.5 0 0];
elseif 5 <= t0 && t0 < 10
  pmfX_teo = [0 0.25 0 0.5 0 0.25 0];
else
  pmfX_teo = [0 0 0 1 0 0 0];
end

figure; grid on; hold on;
xlabel('t'); ylabel('X(t)');
ylim([-3, 3]);
for i = 1 : 50
  stairs(t, X(i, :), 'LineWidth', 4);
  pause(0.02);
end

figure; grid on; hold on;
bar(x, pmfX_sim, 'y');
stem(x, pmfX_teo, 'b', 'LineWidth', 4);
xlabel('x'); ylabel(sprintf('p_{X(%d)}(x)', t0));
