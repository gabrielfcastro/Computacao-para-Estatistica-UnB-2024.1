"Combinando banco de dados"

# Mantém somente as linhas do banco de referência

"
Left --> banco da esquerda
Inner --> intersecção
Semi --> filtra os dados de x com base em y
Anti --> filtro oq está fora do conjunto de dados de x, baseado em y
"

library(tidyverse)

bnames <- read.csv("bnames.csv")
head(bnames)
nascimento <- read.csv("births.csv")
head(births)

# Vamos juntar os dois bancos de dados e criar uma nova coluna com o número de nascimentos por pessoa (prop * births)
bnames2 <- bnames %>%
  left_join(nascimento,by = c("year","sex")) %>%
  mutate(n = round(prop * births))


# Agrupando pelo nome e somando o total de pessoas que nasceram com esse nome
total_de_nascimentos_por_nome <- bnames2 %>% 
  group_by(name) %>% 
  summarise(Total = sum(n))

bnames2 %>%
  group_by(name,sex) %>%
  summarise(Total = sum(n))

# Saber o número de bebes p/ cada som e depois saber o mais popular
bnames2 %>%
  group_by(soundex) %>%
  summarise(Total = sum(n)) %>%
  arrange(desc(Total))


# Saber qual é o nome que faz parte do J500 (mais popular)
bnames2 %>%
  filter(soundex == "J500") %>%
  select(name) %>%
  unique()

# Calcule o número total de meninas e meninos por ano
nascimento_por_sexo_e_ano <- bnames2 %>%
  group_by(year, sex) %>%
  summarise(births = sum(n))

# Plota o resultado
nascimento_por_sexo_e_ano %>%
  ggplot(aes(year, births)) + geom_line(aes(color = sex))
