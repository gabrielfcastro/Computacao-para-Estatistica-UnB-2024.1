library(ggplot2)
library(tidyverse)

"
1 -  Carregar o banco de dados heart e apresentar as 6 primeiras linhas
"

bd <- read.csv("heart.csv")
head(bd)

"
2 -  Observe que a coluna sex está com uma variável do tipo int. Iremos então,
transforma-la em uma varíavel do tipo factory p/ representar variáveis categóricas
"

str(bd)
bd$sex <- factor(bd$sex)
str(bd)
levels(bd$sex) <- c("F","M")
head(bd)
str(bd)

"
3 - Agora, vamos fazer um gráfico Idade x Colesterol (iremos separar as cores por sexo)
"

ggplot(bd, aes(x = age, y = chol)) +
  geom_point(aes(color = sex))

"
4 - Vamos aperfeiçoar ainda mais o gráfico, iremos adicionar título, rótulo dos eixos e legenda
"

ggplot(bd, aes(x = age, y = chol)) +
  geom_point(aes(color = sex)) +
  ggtitle("Colesterol em função da idade") +
  xlab("Idade") +
  ylab("Colesterol") +
  scale_color_discrete(name = "Sexo", labels = c("Feminino","Masculino"))

"
Podemos concluir que tanto homens quanto mulheres têm o colesterol parecido ao longo dos anos, 
porém para as mulheres o colesterol varia mais.
"

"
5 - Vamos calcular a média e o desvio padrão p/ homens e mulheres
"

# Primeiro, para os homens
bd %>% filter(sex == "M") %>%
  summarise(M_homens = mean(chol), Dp_homens = sd(chol))

# Agora, para as mulheres
bd %>% filter(sex == "F") %>%
  summarise(M_mulheres = mean(chol), Dp_mulheres = sd(chol))


"
Podemos observar que a nossa análise anterior estava correta, uma vez que o DP feminino é maior
quando comparada aos homens, bem com ambos possuem médias razoavelmente próximas
"

"
6 -  Agora, iremos criar um boxplot. Primeiramente, é necessário definir o que é: está é usada
para facilitar a análise da distribuíção de dados do nosso conjunto
"

# Iremos odernar nosso boxplo p/ cada categoria do sexo contra o colesterol em função da mediana
ggplot(bd, aes(x =  reorder(sex, chol, median), y = chol)) +
  geom_boxplot() +
  xlab("Sexo") +
  ylab("Colesterol")

"
Podemos notar que como esperado, o sexo masculino tem uma menor dispersão, quando comparado com 
o sexo feminino. Além disso, o sexo feminino possui outliers (valores discrepantes)
"
       

"
7 - Vamos criar um novo banco de dados com pessoas menores que 50 anos e refazer o boxplot
"
bd_50_menos <- bd %>%
  filter(age < 50)
head(bd_50_menos)

ggplot(bd_50_menos, aes(x = sex, y = chol)) +
  geom_boxplot() + 
  xlab("Sexo") +
  ylab("Colesterol")

"
Observando esse gráfico, podemos observar que a distribruíção dos valores para mulheres menores
de 50 anos ficou menos dispersa, bem como não se observe mais a presença de outliers (valores discrepantes),
enquanto que para homens se manteve parecida.
"

"
8 - Vamos criar um gráfico da variável cp segmentada por sexo
"
ggplot(bd, aes(cp)) + geom_bar(aes(fill = sex)) +
  xlab("Categoria de dor no peito") +
  ylab("Entrevistados") +
  scale_fill_discrete(name = "Sexo", labels = c("Feminino", "Masculino"))

"
Primeiro, podemos notar que o número de entrevistados do sexo masculino, foi maior que o número
de entrevistadas do sexo feminino. Além disso, como esperado a maior parte dos entrevistados
possui categorias de dor no peito típicas, ou seja, norma.
"

"
9 - Iremos, refazer o gráfico do item anterior, porém agorá usando frequência relativa
"

# position = "fill", coloca os valores relativos
ggplot(bd, aes(cp)) + geom_bar(aes(fill = sex), position = "fill")

"
10 - Agora, iremos fazer um histograma de taxa mínima de batimentos cardíacos separado por sexo
"

ggplot(bd, aes(thalach)) +
  geom_histogram(aes(fill = sex)) + 
  facet_wrap(~sex)

"
É possível notar que o número mínimo de batimentos cardíacos dos homens é maior
"

"
11 - Por fim, fazemos vamos fazer um histograma igual no item anterior, porém com linha de densidade
na cor cinza.
"

ggplot(bd, aes(thalach)) +
  geom_histogram(aes(y = after_stat(density) ,fill = sex)) + 
  geom_density(color = "black") +
  facet_wrap(~sex)
