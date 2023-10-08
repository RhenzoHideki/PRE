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
\ V_"total" =integral_(-10)^(10) integral_(0)^(20 - abs(x)) k dif y dif x =
\ k integral_(-10)^(10) 20 - abs(x) dif x = 300k
$
]

Sabemos que:
#align(center)[
$
\ V_"total" dot k = 1
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

o coeficiente: $ k = 1/300 $

a área da base é: $ A_Pr[X >= Y] = ( 10 dot 10 )/2 = 50 $

logo: $ Pr[X >= Y]= k dot A_Pr[X >= Y] = 1/300 dot 50 = 1/6 $ 

$ Pr[X >= Y] = 1/6 $
== Resolução da $"PDF"$ marginal em $Y$
\ para : $ - infinity <= y <= 0 $
\ $ f_y (y) = integral_(-infinity)^(infinity) 0 dif x = 0 $
\ para : $ 0 <= y <= 10 $
\ $ f_y (y) = integral_(-10)^(10) 1/200 dif x = 1/10 $
\ para : $ 10 <= y <= 20 $
\ $ f_y (y) = integral_(20+x)^(20+x) 1/100 dif x = -x/50 $

== Resolução da $"CDF"$ marginal de $Y$
\ para : $ - infinity <= y <= 0 $
\ $ f_y (y) = integral_(-infinity)^(infinity) 0 dif x = 0 $
\ para : $ 0 <= y <= 10 $
\ $ f_y (y) = integral_(-10)^(10) y/200 dif x = y/10 $
\ para : $ 10 <= y <= 20 $
\ $ f_y (y) = integral_(20+x)^(20+x) y/100 dif x = ( -x dot y)  /50  + y/10$
\ para : $ 20 <= y <= infinity $
\ $ f_y (y) = 1  $
== Resolução da $"PDF"$ marginal em $Y$ dado X = 5
\ para : $ x = 5 , 0 <= y <= 15 $
\ $ f_x (5) = integral_(0)^(15) 1/300 dif y = 1/20 = 0.05 $
\ $ f_y (y | x=5 ) = ( f_x ,_y ( 5,y) ) /( f_x (5) ) $
\ $ f_y (y | x=5 ) = (1/300) / (1/20) = 1/15 $

== Resolução da covariância entre $X$ e $Y$
$
\ 
\ E[Y] =integral_(-10)^(10) integral_(0)^(20 - abs(x)) k dot y dif y dif x ->
 1/300 dot integral_(-10)^(10) integral_(0)^(20 - abs(x))   y dif y dif
x = 70/9 approx 7.77778
\
\ E[X] =integral_(-10)^(10) integral_(0)^(20 - abs(x)) k dot x dif y dif x ->
 1/300 dot integral_(-10)^(10) integral_(0)^(20 - abs(x))   x dif y dif
x = 0
\
\ E["XY"] =integral_(-10)^(10) integral_(0)^(20 - abs(x)) k dot x dot y dif y dif x ->
 1/300 dot integral_(-10)^(10) integral_(0)^(20 - abs(x))   x dot y dif y dif
x = 0
\ "cov[XY]" = E["XY"]- E[X] dot E[Y] = 0 - 0 dot 70/9 = 0
$