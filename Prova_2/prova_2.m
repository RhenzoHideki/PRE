%Rhenzo Hideki Silva Kajikawa
%9. Sejam U1, U2, U3 ∼ Unif({0, 1, 2}) variaveis aleatorias sorteadas independentemente. Sejam
%X = U1 + U2 + U3, Y = U1(U2 + U3).
%(a) Determine a PMF conjunta de X e Y .
%(b) Determine e esboce as PMFs marginais de X e Y .
%(c) Determine e esboce as PMFs condicionais de X dado que Y = y, para dois valores de y ∈ SY a
%sua escolha.

close all; clear all ; clc;

N = 100;

X = zeros(1,N);
Y = zeros(1,N);

%Gerar X e Y
for i = 1 : N
  A = [0 1 2];
  
  idx = randi([1 3]);
  U1 = A(idx);          % Descobrindo se o U1 está em 0, 1 ou 2
  
  idx = randi([1 3]);
  U2 = A(idx);          % Descobrindo se o U2 está em 0, 1 ou 2
  
  idx = randi([1 3]);
  U3 = A(idx);          % Descobrindo se o U3 está em 0, 1 ou 2
  
  X(i) = U1 + U2 + U3;  % Definicao do X
  Y(i) = U1(U2 + U3);  % Definicao do Y
end

x = 0: 1 :6;
y = 0: 1 :8;


histXY = zeros(7, 7);

for i = 1 : 6
  for j = 1 : 8
    histXY(i, j) = sum(X == x(i) & Y == y(j));
  end
end

pmfXY_sim = histXY / N
PmfXY_teo =[] ;