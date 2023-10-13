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
Y = [Y_1 Y_2 Y_3]^T $.
(b) Sejam
$ Z_1 = Y_1 + Y_2, $
$ Z_2 = Y_2 + Y_3, $
$ Z_3 = Y_3 + Y_1. $
Determine o vetor média e a matriz covariância do $"vetor aleatório" ->
Z = [Z_1 Z_2 Z_3]^T $. Utilize a formulação matricial.

