5%Rhenzo Hideki Silva Kajikawa
%9. Sejam U1, U2, U3 ∼ Unif({0, 1, 2}) variaveis aleatorias sorteadas independentemente. Sejam
%X = U1 + U2 + U3, Y = U1(U2 + U3).
%(a) Determine a PMF conjunta de X e Y .
%(b) Determine e esboce as PMFs marginais de X e Y .
%(c) Determine e esboce as PMFs condicionais de X dado que Y = y, para dois valores de y ∈ SY a
%sua escolha.

close all; clear all ; clc;

N = 100000;

X = zeros(1,N);
Y = zeros(1,N);

%Gerar X e Y
  U1 = randi([0 2], 1, N);
  U2 = randi([0 2], 1, N);
  U3 = randi([0 2], 1, N);

  X = U1 + U2 + U3;  % Definicao do X
  Y = U1.*(U2 + U3);  % Definicao do Y


x = [ 0 1 2 3 4 5 6];
y = [ 0 1 2 3 4 6 8];


histXY = zeros(9, 7);

for i = 1 : 7
  for j = 1 : 7
    histXY(i, j) = sum(X == x(i) & Y == y(j));
  end
end

pmfXY_sim = histXY / N
PmfXY_teo =[1/27 0 0 0 0 0 0;
            3/27 0 0 0 0 0 0;
            4/27 2/27 0 0 0 0 0;
            2/27 0 5/27 0 0 0 0;
            1/27 0 0 2/27 3/27 0 0;
            0 0 0 0 1/27 2/27 0;
            0 0 0 0 0 0 1/27]


% b) PMFs marginais de X e Y

pmfX_sim = hist(X, x) / N
pmfX_teo = [1/27 3/27 6/27 7/27 6/27 3/27 1/27]

pmfY_sim = hist(Y, y) / N
pmfY_teo = [11/27 2/27 5/27 2/27 4/27 2/27 1/27]

figure;
subplot(2, 2, 1); hold on; grid on;
bar(x, pmfX_sim, 'r');
stem(x, pmfX_teo, 'b', 'LineWidth', 4);
xlabel('x'); ylabel('p_X(x)');

subplot(2, 2, 2); hold on; grid on;
bar(y, pmfY_sim, 'r');
stem(y, pmfY_teo, 'b', 'LineWidth', 4);
xlabel('y'); ylabel('p_Y(y)');


% c) PMFs condicionais de X dado que Y = y, para y ∈ {0, 8}

XcondY = X(Y == 0);
pmfX_condY_sim(1, :) = hist(XcondY, x) / sum(Y == 0);

XcondY = X(Y == 8);
pmfX_condY_sim(2, :) = hist(XcondY, x) / sum(Y == 8);

pmfX_condY_teo = [ 1/11  3/11  4/11  2/11  1/11  0  0
                    0      0     0     0    0   0  1] ;

figure
subplot(2, 1,1); hold on; grid on;
bar(x, pmfX_condY_sim(1, :), 'r');
stem(x, pmfX_condY_teo(1, :), 'b', 'LineWidth', 4);
xlabel('x'); ylabel(sprintf('p_X(x | Y = 1)'));

subplot(2, 1,2); hold on; grid on;
bar(x, pmfX_condY_sim(2, :), 'r');
stem(x, pmfX_condY_teo(2, :), 'b', 'LineWidth', 4);
xlabel('x'); ylabel(sprintf('p_X(x | Y = 8)'));

