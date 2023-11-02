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
== Questão sorteada
*7.* Um vetor gaussiano $arrow(X) = mat(X_1 , X_2 , X_3)^T$ tem média nula e matriz covariância $ C_arrow(X) = mat(5 , 0 ,2 ; 0 , 4 , 0 ; 2 , 0 ,3 ) $

Determine:

$"(a)" "Pr"[3<= X_1 <=4].$

$"(b)" "Pr"[3<= X_1 <=4 " e " X_2 < 0].$

$"(c)" "Pr"[3<= X_1 <=4 " e "  X_2 < 0 | X_3 = 3].$

$"(d)" "Pr"[X_1 + X_2 + X_3 > 2].$


#pagebreak()

== Resolução
Dados para as questões:
Sabemos que no caso geral temos:
$ "Pr"[a <= X <= b] = Phi((b-mu)/sigma)-Phi((a-mu)/sigma) $
Também sabemos que a média é:

$ mu = mat(0 ; 0 ; 0)$

\ E covariância: $ C_arrow(X) = mat(5 , 0 ,2 ; 0 , 4 , 0 ; 2 , 0 ,3 ) $
$$

=== Determinando $"Pr"[3<= X_1 <=4].$
Aplicando a formula:
$ "Pr"[3 <= X <= 4] = Phi((4-0)/sqrt(5))-Phi((3-0)/sqrt(5)) = 0.053037 $

=== Determinando $"(b)" "Pr"[3<= X_1 <=4 " e " X_2 < 0].$
Sabemos a partir da covariância que $X_1$ e $X_2$ são independentes, logoaplicando a formula:

$ "Pr"[3 <= X <= 4 and X_2 < 0] = "Pr"[3 <= X <= 4] = Phi((4-0)/sqrt(5))-Phi((3-0)/sqrt(5)) = 0.053037 $


#pagebreak()
=== Determinando $ "Pr"[3<= X_1 <=4 " e "  X_2 < 0 | X_3 = 3].$
Aplicando a formula:
$ mat(X_1 ; X_3 ) ~ arrow(N)(mat(0 ; 0),mat(5 , 2 ; 2 , 3)) $
$ "Pr"[3 <= X <= 4 " e " X_2 < 0 | X_3 = 3] = \  "Pr"[3 <= X <= 4 | X_3 = 3] -> f_X (X_1|X_3 = 3) = (f_X_1,_X_3(X_1,3))/(f_Y (3)) $
$ f_X (X_1|X_3 = 3) = \ (1/(sqrt(tau^2 times det C)))exp(-1/2 mat(X_1 -0 , 3-0)  mat(3/11 , -2/11 ; -2/11 , 5/11) mat( X_1-0 ; 3- 0)) $
$ f_X (X_1|X_3 = 3) = \ (1/(sqrt(tau^2 times 11)))exp(-1/2 times (3X_1 ^2- 12X_1 +45)/11)  $
$ f_Y (3) = (1/(sqrt(tau times 3)))exp(-3/2) $ 
$  (f_X_1,_X_3(X_1,3))/(f_Y (3)) = ((1/(sqrt(tau^2 times 11)))exp(-1/2 times (3X_1 ^2- 12X_1 +45)/11)) / ((1/(sqrt(tau times 3)))exp(-3/2))
$
$  (f_X_1,_X_3(X_1,3))/(f_Y (3)) = sqrt(3)/sqrt(tau * 11) exp(-3/(2*11) (x-2)^2) 
$
$ (X_1 | X_3 = 3) ~ arrow(N)(2,11/3) $
$ "Pr"[3 <= X <= 4 | X_3 = 3] = Phi((4-2)/sqrt(11/3))-Phi((3-2)/sqrt(11/3))= 0.1526 $

#pagebreak()
=== Determinando$"(d)" "Pr"[X_1 + X_2 + X_3 > 2].$
$W=X_1 + X_2 + X_3 , vec(W) = A times arrow(X) + arrow(b)$

$ mat(W) = mat(1 , 1 , 1) times mat(X_1 ; X_2 ; X_3)$

$ arrow(mu)_arrow(W) = A arrow(mu)_arrow(X) + arrow(b) = mat(1 , 1 , 1) times mat(0 ; 0 ; 0) = 0$

$ C_arrow(W) = A C_arrow(X) A^T = mat(1 , 1 , 1) times mat(5 , 0 ,2 ; 0 , 4 , 0 ; 2 , 0 ,3 )  times mat(1 ; 1 ; 1) = 16$
$ "Pr"[W > 2] = Phi((infinity-0)/sqrt(16))-Phi((4-0)/sqrt(16))= 0.4503 $
  