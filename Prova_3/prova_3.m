5%7. Considere duas variaveis aleatorias X e Y com PDF conjunta constante (igual a k) e diferente de zero
##apenas na area sombreada da figura abaixo.
##(a) Determine o valor da constante k.
##(b) Determine Pr[X ≥ Y ].a
##(c) Determine e esboce a PDF marginal de Y .
##(d) Determine e esboce a CDF marginal de Y .
##(e) Determine e esboce a PDF condicional de Y dado X = 5.
##(f) Determine a covariˆancia entre X e Y .


close all; clear all ; clc;

N = 100000;

%Gerar X e Y
X = rand(20 , N) - 10;

for i = 1 : N
  Y(i) = 10 - abs(X(i) * rand());
end

figure; hold on ; grid on;

scatter(X(1:5000),Y(1:5000));
axis('square');
