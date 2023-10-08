#import "../typst-ifsc/templates/article.typ": article


  #show: doc => article(
    title: "Avaliação 2",
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
- A aaliação é individual. Não é permitida a troca de nenhum tipo de informação sobre a avaliação entre os alunos.
- Calculadoras, softwares, livros e outroos materiais podem e devem ser utilizados, mas todos seus passos devem ser jutificados.
- É permitido o envio de manuscritos digitalizado (ex: foto) ou de documento digital.
- Deverá ser enviado um único arquivo em formato *.zip* pelo *SIGAA*, contendo um arquiv *.pdf* e um ou mais arquivos *.m*.
- Devará ser respeitada a data de fechamento indicado no *SIGAA*. Não serão aceitos envios por email.
- Dúvidas? Entre  em contato.
== Questão Sorteada
*9.* Sejam $U_1, U_2, U_3 ∼ "Unif({0, 1, 2})"$ variaveis aleatorias sorteadas independentemente. Sejam

#align(center)[$X = U_1 + U_2 + U_3, Y = U_1(U_2 + U_3).$]
\ (a) Determine a PMF conjunta de X e Y .
\ (b) Determine e esboce as PMFs marginais de X e Y .
\ (c) Determine e esboce as PMFs condicionais de X dado que Y = y, para dois valores de y ∈ SY asua escolha.
#pagebreak()
= Resolução
Temos que:
 \ $U_1, U_2, U_3 ∼ "Unif({0, 1, 2})"$
 \ $X = U_1 + U_2 + U_3 $
 \ $Y = U_1(U_2 + U_3).$

== Resolução da PMF conjunta
Determinando a PMF conjunta 
#align(center)[
#table(
  columns: (auto,auto,auto,auto,auto,auto),
  align:center,
  [$U_1$],[$U_2$],[$U_3$],[$P_u_1,u_2,u_3$],[$X = U_1 + U_2 + U_3$],[$Y = U_1(U_2 + U_3)$],
  [$0$],[$0$],[$0$],[$1/27$],[$0$],[$0$],
  [$0$],[$0$],[$1$],[$1/27$],[$1$],[$0$],
  [$0$],[$0$],[$2$],[$1/27$],[$2$],[$0$],
  [$0$],[$1$],[$0$],[$1/27$],[$1$],[$0$],
  [$0$],[$1$],[$1$],[$1/27$],[$2$],[$0$],
  [$0$],[$1$],[$2$],[$1/27$],[$3$],[$0$],
  [$0$],[$2$],[$0$],[$1/27$],[$2$],[$0$],
  [$0$],[$2$],[$1$],[$1/27$],[$3$],[$0$],
  [$0$],[$2$],[$2$],[$1/27$],[$4$],[$0$],
  [$1$],[$0$],[$0$],[$1/27$],[$1$],[$0$],

  [$1$],[$0$],[$1$],[$1/27$],[$2$],[$1$],
  [$1$],[$0$],[$2$],[$1/27$],[$3$],[$2$],
  [$1$],[$1$],[$0$],[$1/27$],[$2$],[$1$],
  [$1$],[$1$],[$1$],[$1/27$],[$3$],[$2$],
  [$1$],[$1$],[$2$],[$1/27$],[$4$],[$3$],
  [$1$],[$2$],[$0$],[$1/27$],[$3$],[$2$],
  [$1$],[$2$],[$1$],[$1/27$],[$4$],[$3$],
  [$1$],[$2$],[$2$],[$1/27$],[$5$],[$4$],

  [$2$],[$0$],[$0$],[$1/27$],[$2$],[$0$],
  [$2$],[$0$],[$1$],[$1/27$],[$3$],[$2$],
  [$2$],[$0$],[$2$],[$1/27$],[$4$],[$4$],
  [$2$],[$1$],[$0$],[$1/27$],[$3$],[$2$],
  [$2$],[$1$],[$1$],[$1/27$],[$4$],[$4$],
  [$2$],[$1$],[$2$],[$1/27$],[$5$],[$6$],
  [$2$],[$2$],[$0$],[$1/27$],[$4$],[$4$],
  [$2$],[$2$],[$1$],[$1/27$],[$5$],[$6$],
  [$2$],[$2$],[$2$],[$1/27$],[$6$],[$8$]

)
]

#pagebreak()
== Resolução da PMFs marginais de $x$ e $y$
Determinando a tabela PMFs marginais de $x$ e $y$
#align(center)[
#table(
  columns: (auto,auto,auto,auto,auto,auto,auto,auto,auto),
  align:center,
  [],[$y=0$],[$y=1$],[$y=2$],[$y=3$],[$y=4$],[$y=6$],[$y=8$],[$p_x (x)$],
  [$x=0$],[$1/27$],[$0$],[$0$],[$0$],[$0$],[$0$],[$0$],[$1/27$],
  [$x=1$],[$3/27$],[$0$],[$0$],[$0$],[$0$],[$0$],[$0$],[$3/27$],
  [$x=2$],[$4/27$],[$2/27$],[$0$],[$0$],[$0$],[$0$],[$0$],[$6/27$],
  [$x=3$],[$2/27$],[$0$],[$5/27$],[$0$],[$0$],[$0$],[$0$],[$7/27$],
  [$x=4$],[$1/27$],[$0$],[$0$],[$2/27$],[$3/27$],[$0$],[$0$],[$6/27$],
  [$x=5$],[$0$],[$0$],[$0$],[$0$],[$1/27$],[$2/27$],[$0$],[$3/27$],
  [$x=6$],[$0$],[$0$],[$0$],[$0$],[$0$],[$0$],[$1/27$],[$1/27$],
  [$p_y (y)$],[$11/27$],[$2/27$],[$5/27$],[$2/27$],[$4/27$],[$2/27$],[$1/27$],[$1$]
  
)
  #figure(
   image("./Figuras/pmfs.png",width: 100%),
   caption: [
    Gráficos das PMFs de $x$ e $y$
   ] 
  )
]


#pagebreak()
== Resolução das PMFs condicionais de X dado que Y = y, para dois valores de y ∈ SY asua escolha.
Determinando as PMFs conficionais de X dado que Y = y,  para $y ∈ {0, 8}$
#align(center)[

  
#table(
  columns: (auto , auto),
    inset: 10pt,
    
  [$p_x (x|y=0)$],[$p_x (x|y=8)$],
  [$ 1/27 / 11/27 = 1/11 $],[$ 0  / 1/27 = 0 $],
  [$ 3/27 / 11/27 = 3/11 $],[$ 0  / 1/27 = 0 $],
  [$ 4/27 / 11/27 = 4/11 $],[$ 0  / 1/27 = 0 $],
  [$ 2/17 / 11/27 = 2/11 $],[$ 0  / 1/27 = 0 $],
  [$ 1/27 / 11/27 = 1 /11 $],[$ 0 / 1/27 = 0 $],
  [$ 0 / 11/27 = 0 $],[$ 0 / 1/27 = 0$],
  [$ 0 / 11/27 = 0 $],[$ 1/27 / 1/27 = 1 $]
) 

  #figure(
   image("./Figuras/pmfs_cond.png",width: 100%),
   caption:[
    Gráficos das PMFs de $X$ para $y ∈ {0, 8}$
   ]
  )
]