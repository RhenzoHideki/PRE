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


##for i = 1 : N
##  Y(i) = rand()*(20 - abs(X(i))) ;
##end

for i = 1: N
  do
    X(i) = 20*rand() - 10;
    Y(i) = 20*rand();
  until Y(i) <= (20 - abs(X(i)))
end

figure; hold on ; grid on;
scatter(X(1:15000),Y(1:15000));
axis('square');

##(b) Determine Pr[X ≥ Y ].a

PrX_maior_igual_Y_sim = mean(X >= Y)
PrX_maior_igual_Y_teo = 1/6

% c) PDF marginal de Y

y = -25 : 0.5 : 25;

pdfY_sim = hist(Y, y) / (N);
%pdfY_teo ;

figure
subplot(3, 1, 1); grid on; hold on;
bar(y, pdfY_sim, 'y');

% d) CDF marginal de Y

cdfY_sim = cumsum(hist(Y, y)) / N;

subplot(3, 1, 2); grid on; hold on;
plot(y, cdfY_sim, 'g', 'LineWidth', 4);


% e) PDF condicional de Y dado que X = 5
x0 = 5;
Ycond = Y(abs(X - x0) < 0.001);
pdfYcond_sim = hist(Ycond , y)/(length(Ycond)) ;


subplot(3, 1, 3); grid on; hold on;
bar(y, pdfYcond_sim, 'y');

% f) Covariância entre X e Y
rhoXY_sim = cov(X, Y) / sqrt(var(X) * var(Y))

