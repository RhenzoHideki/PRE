%% Rhenzo Hideki Silva Kajikawa
##9. Considere uma variavel aleatoria X definida atraves do seguinte experimento probabilıstico. Um dado
##honesto e lancado.
##• Se o resultado for 1 ou 2, ent˜ao X ∼ Unif({1, 2, 3, 4}).
##• Se o resultado for 3, ent˜ao X = 3.
##• Se o resultado for 4, 5 ou 6, ent˜ao X ∼ Unif([1, 4]).
##(a) Determine e esboce a PDF de X.
##(b) Determine e esboce a CDF de X.
##(c) Determine a media de X.
##(d) Determine Pr[X > 3].

clear all ; close all ; clc;

%--------------------------------------------------------------------------------------------------------
% a)

N = 1000000;
U = randi([1 6], 1, N);           % Dados sendo lancados N vezes

% Encontrando as posicoes em que dado caiu com as respectivas faces
idx1 = (U == 1| U == 2);
idx2 = (U == 3);
idx3 = (U == 4|U == 5 | U == 6);

X = zeros(1,N); % Preenche a matriz x, 1 linha N colunas , com 0

X(idx1) =  randi([1 4], 1, sum(idx1));  #• Se o resultado for 1 ou 2, ent˜ao X ∼ Unif({1, 2, 3, 4}).
X(idx2) = 3;                            #• Se o resultado for 3, ent˜ao X = 3
X(idx3) = 3*rand(1,sum(idx3))+1;        #• Se o resultado for 4, 5 ou 6, ent˜ao X ∼ Unif([1, 4]).

dx = 0.01;
x = -0.5 : dx : 5 ;

freqX = hist(X,x);

figure; hold on; grid on;
subplot(2,1,1);


%Nomeando os eixos
xlabel('x');
ylabel('f_X(x)');

%Grafico da PDF simulada
pdfX_sim = freqX / (N *dx);
bar(x,pdfX_sim,'r');
xlim([0.5 , 4.5]);
ylim([-0.1 , 1]);

 hold on; grid on;
%Grafico da PDF teorica
pdfX_teo = (1/6) .*( 1 < x & x < 4 )  ;
plot(x , pdfX_teo , 'b' , 'LineWidth',2);

%Desenho dos impulsos

plot([1, 1], [0, 1/12], 'b', 'LineWidth', 3');
plot([1], [1/12], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');

plot([2, 2], [0, 1/12], 'b', 'LineWidth', 3');
plot([2], [1/12], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');

plot([3, 3], [1/12, 1/4], 'b', 'LineWidth', 3');
plot([3, 3], [0, 1/12], 'b', 'LineWidth', 3');

plot([3], [1/4], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');


plot([4, 4], [0, 1/12], 'b', 'LineWidth', 3');
plot([4], [1/12], 'b^', 'MarkerSize', 12, 'MarkerFaceColor', 'b');

%--------------------------------------------------------------------------------------------------------
% b)

% Grafico da CDF simulada

subplot(2, 1, 2); hold on; grid on;
xlabel('x');
ylabel('F_X(x)');

xlim([0.5 , 4.5]);
ylim([-0.1 , 1.1]);


cdfX_sim = cumsum(freqX)/N;
plot(x, cdfX_sim, 'r', 'LineWidth', 4);

% Grafico da CDF calculada
cdfX_teo = (0)          .* (1 > x)         + ...
           (x/6 - 1/12) .* (1 <= x & x < 2) + ...
           (x/6)       .* (2 <= x & x < 3) + ...
           (1/4 + x/6) .* (3 <= x & x < 4) + ...
           1           .* (4 <= x);

plot(x, cdfX_teo, 'b--', 'LineWidth', 3);
%--------------------------------------------------------------------------------------------------------
% c)
printf('Sim: E[X] = %g\n', mean(X));% Experanca matematica simulada
printf('Teo: E[X] = %g\n', 9/4);    % Experanca matematica calculada


%--------------------------------------------------------------------------------------------------------
##(d) Determine Pr[X > 3].
PrX_maior_3_sim = sum(3 < X)/N     % Probabilidade de X > 3 simulada
PrX_maior_3_teo = 1/4         % Probabilidade de X > 3 calculada
