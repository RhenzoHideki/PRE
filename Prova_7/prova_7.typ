#import "../typst-ifsc/templates/article.typ": article


  #show: doc => article(
    title: "Avaliação 3",
    subtitle: "Processos Estocásticos (PRE029006)",
    // Se apenas um autor colocar , no final para indicar que é um array
    authors:("Rhenzo Hideki Silva Kajikawa",),
    date: "20 de Setembro de 2023",
    doc,
  )
= Comando da Avaliação
== Atenção
- Resolva apenas a questão sorteada
- Simule (Monte Carlo) todos os itens da questão no Octave/MATLAB
== Instruções gerais:
- A avaliação é individual. Não é permitida a troca de nenhum tipo de informação sobre a avaliação entre os alunos.
- Calculadoras, softwares, livros e outros materiais podem e devem ser utilizados, mas todos seus passos devem ser justificados.
- É permitido o envio de manuscritos digitalizado (ex: foto) ou de documento digital.
- Deverá ser enviado um único arquivo em formato *.zip* pelo *SIGAA*, contendo um arquivo *.pdf* e um ou mais arquivos *.m*.
- Deverá ser respeitada a data de fechamento indicado no *SIGAA*. Não serão aceitos envios por email.
- Dúvidas? Entre  em contato.


#pagebreak()
= Questão sorteada
6. Considere dois processos de Poisson, $X_1 (t)$ e $X_2 (t)$, independentes, de taxas $lambda_1 = 2$ e $lambda_2 = 2,5$ eventos/s, respectivamente. Seja $X(t) = X_1 (t) + X_2 (t)$. As questões abaixo são todas referentes ao processo estocástico $X(t)$

\ (a) Determine e esboce a função média do processo estocástico.
\ (b) Determine a probabilidade de ocorrer pelo menos quinze eventos entre 6 e 9s , dados que ocorreu um evento entra 10 e 13s.
\ (c) Determine a probabilidade de que o tempo decorrido entre o segundo evento e o terceiro evento seja maior que 0,1s
\ (d) Determine a matriz covariância do vetor aleatório $[X(4) X(3)]^T$

#pagebreak()
= Resolução
== (a) Determine e esboce a função média do processo estocástico.
$
 mu_x (t) = lambda t [t>=0] , lambda = lambda_1 + lambda_2 
\ lambda_1 = 2 , lambda_2 = 2.5
\ lambda = 2 + 2.5 = 4.5
\ mu_x (t) = 4.5 t[t>=0] 
\ 
$

== (b) Determine a probabilidade de ocorrer pelo menos quinze eventos entre 6 e 9s , dados que ocorreu um evento entra 10 e 13s.
$
Pr[X_6,_9 >= 15 | X_10,_13 = 1] = Pr[X_6,_9 >= 15] , X_6,_9 ~ "Poisson"(4.5(9-6))
\ p_x(x) = e^(-mu) mu^x / x! , Pr[X_6,_9  >= 15]= 1-e^(-4.5 dot 3) sum _(x = 0) ^ 15 ((4.5 dot 3)^x / x) = 0.282207
$
== (c) Determine a probabilidade de que o tempo decorrido entre o segundo evento e o terceiro evento seja maior que 0,1s
$
Delta 3 = T_3 - T_2 , Delta n = e^lambda
\ Pr[Delta 3 > 0.1] = integral _ 0.1 ^ infinity 4.5 e^(-4.5x) dif x = e^(-4.5x) | _0.1 ^infinity = e^(-4.5 times infinity) - e^(-4.5 times 0.1) 
\ Pr[Delta 3 > 0.1]  = 0 - e^(-0.45) = 0.6376
$

== (d) Determine a matriz covariância do vetor aleatório $[X(4) X(3)]^T$

 $
 arrow(X) = [X(4) X(3)]^T
 \ C arrow(x) = mat("cov"(X(4),X(4)) , "cov"(X(4),X(3)) ; "cov"(X(3),X(4)) , "cov"(X(3),X(3))) 
\ "cov"(t_1,t_2) = lambda times min(t_1,t_2)[t_1 , t_2 >= 0]
\ "cov"(x(4),x(4))= 4.5 times 4 = 17 
\ "cov"(x(4),x(3))= 4.5 times 3 = 13.5
\ "cov"(x(3),x(3))= 4.5 times 3 = 13.5
 \ C arrow(x) = mat(18 , 13.5 ; 13.5 , 13.5) 
 $