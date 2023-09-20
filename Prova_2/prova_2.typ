#import "../typst-ifsc/template-article.typ": article


  #show: doc => article(
    title: [
        Avaliação 2
    ],
    subtitle: [
        Processos Estocásticcos (PRE029006)
    ],
    // Se apenas um autor colocar , no final para indicar que é um array
    authors: (
      [Rhenzo Hideki Silva Kajikawa],
    ),
    date: [
      20 de Setembro de 2023
    ],
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
\ (c) Determine e esboce as PMFs condicionais de X dado que Y = y, para dois valores de y ∈ SY a
sua escolha.