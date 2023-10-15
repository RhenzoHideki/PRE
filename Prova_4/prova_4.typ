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
== Questão Sorteada
* 10. *  Sejam $X_1, X_2, X_3 ∼ "Bern"(1/3)$ variáveis aleatórias sorteadas independentemente.
(a) Sejam
$ Y_1 = X_1 X_2, $
$ Y_2 = X_2 X_3, $
$ Y_3 = X_3 X_1. $

Determine o vetor média e a matriz covariância do $"vetor aleatório" ->
arrow(Y) = [Y_1 Y_2 Y_3]^T $.
(b) Sejam
$ Z_1 = Y_1 + Y_2, $
$ Z_2 = Y_2 + Y_3, $
$ Z_3 = Y_3 + Y_1. $
Determine o vetor média e a matriz covariância do $"vetor aleatório" ->
arrow(Z) = [Z_1 Z_2 Z_3]^T $. Utilize a formulação matricial.

#pagebreak()
= Resolução
== Determine o vetor média e a matriz covariância do $"vetor aleatório" -> arrow(Y) = [Y_1 Y_2 Y_3]^T $.
Sabemos que:
$ Y_1 = X_1 X_2, $
$ Y_2 = X_2 X_3, $
$ Y_3 = X_3 X_1. $

e também que $X_1, X_2, X_3 ∼ "Bern"(1/3)$
===  Determinando o vetor média do $"vetor aleatório" -> arrow(Y) = [Y_1 Y_2 Y_3]^T $.

Determinando a PMF:
#align(center)[
#table(
  columns: (auto,auto,auto,auto,auto,auto,auto,auto),
  align:center,
  [$X_1$],[$X_2$],[$X_3$],[$Pr_0$],[$Pr_1$],[$Y_1 = X_1 X_2,$],[$Y_2 = X_2 3$],[$3 = X_3 X_1.3$],
  [$0$],[$0$],[$0$],[$2/3$],[$1/3$],[$0$],[$0$],[$0$],
  [$0$],[$0$],[$1$],[$2/3$],[$1/3$],[$0$],[$0$],[$0$],
  [$0$],[$1$],[$0$],[$2/3$],[$1/3$],[$0$],[$0$],[$0$],
  [$0$],[$1$],[$1$],[$2/3$],[$1/3$],[$1$],[$0$],[$0$],
  [$1$],[$0$],[$0$],[$2/3$],[$1/3$],[$0$],[$0$],[$0$],
  [$1$],[$0$],[$1$],[$2/3$],[$1/3$],[$0$],[$0$],[$1$],
  [$1$],[$1$],[$0$],[$2/3$],[$1/3$],[$0$],[$1$],[$0$],
  [$1$],[$1$],[$1$],[$2/3$],[$1/3$],[$1$],[$1$],[$1$],
)
#table(
  columns: (auto,auto),
  align:center,
  [$arrow(Y)$],[$P_arrow(Y) (arrow(Y))$],
  [$mat(0, 0 ,0)$],[$20/27$],
  [$mat(1, 0 ,0)$],[$2/27$],
  [$mat(0, 1 ,0)$],[$2/27$],
  [$mat(0, 0 ,1)$],[$2/27$],
  [$mat(1, 1 ,1)$],[$1/27$],

)
 $arrow(µ)_arrow(Y) = mat(E[Y_1] ; E[Y_2] ; E[Y_3])$

#pagebreak()
  $ E[Y_1] = (0) 20/27 + (1) 2/27 + (0) 2/27 + (0) 2/27 + (1) 1 /27 = 1/9 $
  $ E[Y_2] = (0) 20/27 + (0) 2/27 + (1) 2/27 + (0) 2/27 + (1) 1 /27 = 1/9 $
  $ E[Y_3] = (0) 20/27 + (0) 2/27 + (0) 2/27 + (1) 2/27 + (1) 1 /27 = 1/9 $
]
$ arrow(µ)_arrow(Y) = mat(1/9 ; 1/9 ; 1/9) $

===  Determinando a matriz covariância do $"vetor aleatório" -> arrow(Y) = [Y_1 Y_2 Y_3]^T $.
$ C_arrow(Y) = mat( "var"(Y_1) , "cov"(Y_1 , Y_2) , "cov"(Y_3 , Y_1);
                   "cov"(Y_1 , Y_2) , "var"(Y_2) , "cov"(Y_1 , Y_2);
                  "cov"(Y_3 , Y_1) , "cov"(Y_1 , Y_2) , "var"(Y_3);) $

  $ arrow(µ)_arrow(Y) = mat(E[Y_1] ; E[Y_2] ; E[Y_3]) = mat(1/9 ; 1/9 ; 1/9) $
  $ "var"(Y_i) =  E[Y_i ^2] -E[Y_i]^2 $
  logo :

  $ E[Y_1] = (0) 20/27 + (1) 2/27 + (0) 2/27 + (0) 2/27 + (1) 1 /27 = 1/9 $
  $ E[Y_2] = (0) 20/27 + (0) 2/27 + (1) 2/27 + (0) 2/27 + (1) 1 /27 = 1/9 $
  $ E[Y_3] = (0) 20/27 + (0) 2/27 + (0) 2/27 + (1) 2/27 + (1) 1 /27 = 1/9 $
  $ E[Y_1 ^2] = (0)^2 20/27 + (1)^2 2/27 + (0)^2 2/27 + (0)^2 2/27 + (1)^2 1 /27 = 1/9 $
  $ E[Y_2 ^2] = (0)^2 20/27 + (0)^2 2/27 + (1)^2 2/27 + (0)^2 2/27 + (1^2) 1 /27 = 1/9 $
  $ E[Y_3 ^2] = (0)^2 20/27 + (0)^2 2/27 + (0)^2 2/27 + (1)^2 2/27 + (1)^2 1 /27 = 1/9 $
  $ "var"(Y_1) =  1/9 -(1/9)^2 = 8/81 $
  $ "var"(Y_2) =  1/9 -(1/9)^2 = 8/81 $
  $ "var"(Y_3) =  1/9 -(1/9)^2 = 8/81 $
  $ "cov"(Y_1 , Y_2) =  E[Y_1 , Y_2] - E[Y_1]E[Y_2] $
  $ "cov"(Y_2 , Y_3) =  E[Y_2 , Y_3] - E[Y_2]E[Y_3] $
  $ "cov"(Y_3 , Y_1) =  E[Y_3 , Y_1] - E[Y_3]E[Y_1] $
 $ E[Y_1 , Y_2] = (0)(0) 20/27 + (1)(0) 2/27 + (0)(1) 2/27 + (0)(0) 2/27 + (1)(1) 1 /27 = 1/27 $
 $ E[Y_2 , Y_3] = (0)(0) 20/27 + (0)(0) 2/27 + (1)(0) 2/27 + (0)(1) 2/27 + (1)(1) 1 /27 = 1/27 $
 $ E[Y_3 , Y_1] = (0)(0) 20/27 + (0)(1) 2/27 + (0)(1) 2/27 + (1)(0) 2/27 + (1)(1) 1 /27 = 1/27 $
$ "cov"(Y_1 , Y_2) =  E[Y_1 , Y_2] - E[Y_1]E[Y_2] = 1/27 - 1/9 dot 1/9 = 2/81 $
$ "cov"(Y_2 , Y_3) =  E[Y_2 , Y_3] - E[Y_2]E[Y_3] = 1/27 - 1/9 dot 1/9 = 2/81 $
$ "cov"(Y_3 , Y_1) =  E[Y_3 , Y_1] - E[Y_3]E[Y_1] = 1/27 - 1/9 dot 1/9 = 2/81 $
$ C_arrow(Y) = mat( "var"(Y_1) , "cov"(Y_1 , Y_2) , "cov"(Y_3 , Y_1);
                   "cov"(Y_1 , Y_2) , "var"(Y_2) , "cov"(Y_1 , Y_2);
                  "cov"(Y_3 , Y_1) , "cov"(Y_1 , Y_2) , "var"(Y_3);) 
                  = 
                mat(  8/81 , 2/81 , 2/81;
                   2/81 ,  8/81 , 2/81;
                  2/81 , 2/81 ,  8/81;)   $

#pagebreak()
== Determine o vetor média e a matriz covariância do $"vetor aleatório" -> arrow(Z) = [Z_1 Z_2 Z_3]^T $. Utilize a formulação matricial.
Sejam
$ Z_1 = Y_1 + Y_2, $
$ Z_2 = Y_2 + Y_3, $
$ Z_3 = Y_3 + Y_1. $
===  Determinando o vetor média do $"vetor aleatório" -> arrow(Z) = [Z_1 Z_2 Z_3]^T $.
$ arrow(Z) = A dot arrow(Y) + arrow(b) $
$
 mat(Z_1 ; Z_2 ; Z_3 ) = mat( 1 , 1 , 0 ; 0 , 1 , 1 ; 1 , 0 , 1)mat(Y_1 ; Y_2 ; Y_3) + mat(0 ; 0 ; 0)
$
portanto: 
$
 arrow(µ)_arrow(Z) = A dot arrow(µ)_arrow(Y) + arrow(b)  = mat( 1 , 1 , 0 ; 0 , 1 , 1 ; 1 , 0 , 1) mat(1/9 ; 1/9 ; 1/9) + mat(0 ; 0 ; 0) = mat(2/9 ; 2/9 ; 2/9)

$
===  Determinando a matriz covariância do $"vetor aleatório" -> arrow(Z) = [Z_1 Z_2 Z_3]^T $.

$
 C_arrow(Z) = A dot C_arrow(Y) A^T  = mat( 1 , 1 , 0 ; 0 , 1 , 1 ; 1 , 0 , 1) mat(1/9 ; 1/9 ; 1/9) mat( 1 , 0 , 1 ; 1 , 1 , 0 ; 0 , 1 , 1) = mat(20/81,14/81,14/81;14/81,20/81,14/81;14/81,14/81,20/81)
$