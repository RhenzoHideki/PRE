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