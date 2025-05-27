"
Aluno: Gabriel Francisco 
Matrícula: 202066571
"

"
Questão 1) A seguir, iremos criar uma sequência de números que variam de -3 a 3, com passo
de 0.25
"

x <- seq(-3,3,0.25)
x

"
Questão 2) Agora, vamos calcular a expressão matemática abaixo para cada um dos números da nossa
sequência criada no item anterior
"

expressao <- ( 1/sqrt(2*pi) ) * exp(- x^2 / 2 )
expressao

"
Questão 3) A seguir, iremos criar uma matriz com 2 linhas e 3 colunas, sendo a primeira
linha contendo o dia (coluna 1), mês (coluna 2), ano (coluna 3). E a segunda linha deve
conter o dia, mês, ano e coluna do aniversário de um familiar.
"

vet <- c(8,2,2002,8,12,1965)
mat <- matrix(vet, nrow = 2,byrow = T)
mat

"
Questão 4) Para a próxima questão iremos transformar nossa matriz criada anteriormente
em um dataframe e nomear as suas colunas
"

df <- data.frame(mat)
df

"Agora, iremos nomear as colunas de: dia, mês e ano respectivamente"

names(df) <- c("Dia", "Mês","Ano")
df

"
Para as próximas questões vamos utilizar o banco de dados pressure presente
no Rstudio.
"

base_de_dados <- pressure
base_de_dados

"
Questão 5) A seguir vamos alterar a temperatura que está na linha 14 para 2000
"

# Primeiro, vamos ver qual é o elemento que está sendo armazenada na na linha 14 da coluna referente a temperatura
temperatura <- base_de_dados[14,1]
temperatura

# Agora, iremos fazer a substituíção e observar o novo valor presente na linha 14 referente a temperatura
base_de_dados[14,1] <- 2000
temperatura <- base_de_dados[14,1]
temperatura

"
Questão 6) Agora, criaremos uma nova coluna indicando se a pressão está entre 1 e 100.
"

# Para obter o resultado esperado a pressão precisa ser maior ou igual a 1 e menor ou igual a 100
nova_coluna <- base_de_dados$pressure >= 1 & base_de_dados$pressure <= 100
nova_coluna

base_de_dados$"A pressão está entre 1 e 100 ?" <- nova_coluna
base_de_dados

"
Questão 7) Agora, vamos responder um teste lógico se todas as pressões estão entre 1 e 100.
Para fazer isso, vamos apenas fazer um all, o qual será responsável por levar em conta TODOS os dados
"
# Observe que a resposta é FALSE, o que era esperado uma vez que não são todas as pressões que estão entre 1 e 100
all(nova_coluna)

"
Questão 8) Por fim, iremos fazer um code chunk da saída da questão 1.
"
```{r echo=FALSE}
x <- seq(-3,3,0.25)
x
```
