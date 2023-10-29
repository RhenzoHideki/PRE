%7. Considere duas variaveis aleatorias X e Y com PDF conjunta constante (igual a k) e diferente de zero
##apenas na area sombreada da figura abaixo.
##(a) Determine o valor da constante k.
##(b) Determine Pr[X ≥ Y ].a
##(c) Determine e esboce a PDF marginal de Y .
##(d) Determine e esboce a CDF marginal de Y .
##(e) Determine e esboce a PDF condicional de Y dado X = 5.
##(f) Determine a covariˆancia entre X e Y .


close all; clear all ; clc;

N = 100000;
dy = 0.5;
y = -0.5 : dy : 20.5;
dx = 0.5;
x = -10.5 : dx : 10.5;


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

pdfY_sim = hist(Y, y) / (N * dy );
pdfY_teo = 20/300 .* (0 <= y & y < 10) + ...
            (40-2.*y)/300 .* (10 <= y & y < 20);

figure
subplot(3, 1, 1); grid on; hold on;
bar(y, pdfY_sim, 'y');
plot(y, pdfY_teo, 'b', 'LineWidth', 4);
xlabel('y'); ylabel('f_Y(y)');

% d) CDF marginal de Y

cdfY_sim = cumsum(hist(Y, y)) /(N);
cdfY_teo = (y/15) .* ( 0 <= y & y <10) + ...
           (((-y.^2)/300) +2.*y/15 - 1 + (10/15) )  .* ( 10 <= y & y <= 20) +...
           (1)  .* ( 20 < y);


subplot(3, 1, 2); grid on; hold on;
plot(y, cdfY_sim, 'g', 'LineWidth', 4);
plot(y, cdfY_teo, 'b--', 'LineWidth', 2);
xlabel('y'); ylabel('F_Y(y)');
xlim([-25 25]); ylim([-0.2, 1.2]);


% e) PDF condicional de Y dado que X = 5
idx = (4 <= X) & (X <= 6);
histY_condX = hist(Y(idx), y);
pdfY_condX_sim = histY_condX / trapz(y, histY_condX);
pdfY_condX_teo = 1/15 .*  (0 <= y & y < 15);

subplot(3, 1, 3); grid on; hold on;
bar(y, pdfY_condX_sim, 'y');
plot(y, pdfY_condX_teo, 'b', 'LineWidth', 4);
xlabel('y'); ylabel('F_Y(y / X = 5)');


% f) Covariância entre X e Y
rhoXY_sim = cov(X, Y) / sqrt(var(X) * var(Y))
rhoXY_teo = 0
