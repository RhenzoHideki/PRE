#import "../typst-ifsc/template-article.typ": article


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
- A aaliação é individual. Não é permitida a troca de nenhum tipo de informação sobre a avaliação entre os alunos.
- Calculadoras, softwares, livros e outroos materiais podem e devem ser utilizados, mas todos seus passos devem ser jutificados.
- É permitido o envio de manuscritos digitalizado (ex: foto) ou de documento digital.
- Deverá ser enviado um único arquivo em formato *.zip* pelo *SIGAA*, contendo um arquiv *.pdf* e um ou mais arquivos *.m*.
- Devará ser respeitada a data de fechamento indicado no *SIGAA*. Não serão aceitos envios por email.
- Dúvidas? Entre  em contato.


#pagebreak()
== Questão Sorteada
*1.* Considere duas variáveis aleatórias $X$ e $Y$ com $"PDF"$ conjunta constante (igual a k) e diferente de zero apensa na área sombreada da figura abaixo

#align(center)[
  #figure(
   image("./Figuras/Grafico.png",width: 100%),
    caption: "Gráfico elaborado pelo professor",
    supplement: "Figura",
)]

\ (a) Determine o valor da constante k .
\ (b) Determine $Pr[X >= Y]$ .
\ (c) Determine e esboce a $"PDF"$ marginal em $Y$.
\ (d) Determine e esboce a $"CDF"$ marginal de $Y$.
\ (e) Determine e esboce a $"PDF"$ condicional de $Y$ dado $X = 5$.
\ (f) Determine a covariância entre $X$ e $Y$.

#pagebreak()
= Resolução
== Determinando a $"PDF"$ conjunta $X$ e $Y$
Temos: 

#align(center)[
$X ~ "Unif"([-10,10])$

$Y|X=x ~ "Unif"([0,x])$
]
Portanto: 
  #align(center)[
$
\ f_X (x) = 1 dot [-10 <= x <= 10]
\ f_Y (y|X=x) = [0<= y <= 20-abs(x) ]
\ f_x,_y (x,y) = f_X(x) and f_Y(Y|X=x)
$
]
#align(center)[
  #figure(
   image("./Figuras/fyANDfx.png",width: 110%),
    caption:"Ilustrando a intersecção das 2 funções ",
    supplement: "Figura ",
  )
]
\ A função em vermelho é $f_X (x)$ , nela podemos ver o intervalo respeita 
$f_X (x) = [-10 <= x <= 10]$ .
\ A função em azul é $f_Y (y)$ , nela é possível ver que também respeita o calcula acima $f_Y (y|X=x) = [0<= y <= 20-abs(x) ] $.
\ Com essas 2 funções pode-se chegar na função da questão a colorida em magenta , fazendo a intersecção delas $f_x,_y (x,y) = f_X(x) and f_Y(Y|X=x)$ 

#pagebreak();
== Determine o valor da constante k

Portanto: 
  #align(center)[
$
\ 
\ A_"total" =integral_(-10)^(10) integral_(0)^(20 - abs(x)) 1 dif y dif x =
\ integral_(-10)^(10) 20 - abs(x) dif x = 300
$
]

Sabemos que:
#align(center)[
$
\ A dot k = 1
\ 300 dot k = 1
\ k = 1/300
$ 
]
== Resolução da $Pr[X >= Y]$
Para calcular a $Pr[X >= Y]$ podemos criar uma reta $d$ que respeita a seguinte condição $d : X>=Y$ , teremos  uma reta como na figura a seguir:  
#align(center)[
  #figure(
   image("./Figuras/fxyANDPrxy.png",width: 110%),
    caption:"Ilustrando a intersecção de "  +  $f_Y (y|X=x)$ + " e  " + $d$,
    supplement: "Figura ",
  )
]
A função em laranja é a $f_Y (y|X=x)$ e a area em azul é $d$ , a area em magenta é o que a questão quer $Pr[X >= Y]$
Baseando-se no gráfico podemos calcular a área de $Pr[X >= Y]$,

\
\

o coeficiente $k = 1/300$

a área é $A_Pr[X >= Y] = ( 10 dot 10 )/2 = 50$

logo $Pr[X >= Y]= k dot A_Pr[X >= Y] = 1/300 dot 50 = 1/6$ 

$Pr[X >= Y] = 1/6 $
== Resolução da $"PDF"$ marginal em $Y$
$f_Y(y) = integral_( - infinity )^( infinity ) f_X,_Y (x,y) dif x$
\ $f_Y(y) = integral_( - infinity )^( infinity ) f_X,_Y (x,y) dif x$

== Resolução da $"CDF"$ marginal de $Y$

== Resolução da $"PDF"$ condicional de $Y$ dado $X = 5$

== Resolução da covariância entre $X$ e $Y$
