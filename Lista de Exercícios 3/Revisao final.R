# Preparando o ambinete
library(ggplot2)
library(tidyverse)

# 1 - Vamos carregar o banco de dados heart e mostrar as 6 primeiras linhas
bd <- read.csv("heart.csv")
head(bd)

str(bd)

"
Observe que a coluna sexo está definida como inteiro, iremos transformar em variáveis 
categóricas primeiro.
"

# 2
bd$sex <- factor(bd$sex)
levels(bd$sex) <- c("F","M")

# 3 - Agora, vamos fazer um gráfico IDADE x COLESTEROL, e separa-lo por sexo
ggplot(bd, aes(x = age, y = chol)) +
  geom_point(aes(color = sex))
 
# 4 - Vamos melhorar o gráfico anterior
ggplot(bd, aes(x = age, y = chol)) +
  geom_point(aes(color = sex)) +
  ggtitle("Idade x Colesterol") +
  xlab("Idade") +
  ylab("Colesterol") +
  scale_color_discrete(name = "Sexo", labels = c("Masculino", "Feminino"))

# 5 - Calcular a média e o desvio padrão por sexo
"Sexo MASCULINO"
bd %>%
  filter(sex == "M") %>%
  summarise(M = round(mean(chol)), DP = round(sd(chol)))

"Sexo FEMININO"
bd %>%
  filter(sex == "F") %>%
  summarise(M = round(mean(chol)), DP = round(sd(chol)))

# 6 - 
"
Função REORDER
"

ggplot(bd, aes(x = reorder(sex, chol, median), y = chol)) +
  geom_boxplot()

# 7 - 
# 7a. Vamos criar um banco de dados apenas com indivíduos 50 menos
bd_50_menos <- bd %>%
  filter(age < 50)

# 7b.Vamos refazer o boxplot
ggplot(bd_50_menos, aes(x = sex, y = chol)) +
  geom_boxplot()

# 8 -
ggplot(bd, aes(cp)) +
  geom_bar(aes(fill = sex))

# 9 - Gráfico de barras por sequência relativa 
ggplot(bd, aes(cp)) +
  geom_bar(aes(fill = sex), position = "fill")

# 10 -
ggplot(bd, aes(thalach)) +
  geom_histogram(aes(fill = sex)) +
  facet_wrap(~sex)

# 11 - 
"
LINHA
"
ggplot(bd, aes(thalach)) +
  geom_histogram(aes(y = after_stat(density),fill = sex)) +
  geom_density(color = "black") +
  facet_wrap(~sex)
  