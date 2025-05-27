library(tidyverse)
library(nycflights13)

f <- flights
head(f)

"
1 
"

# a. Vamos encontrar todos os voos que tiveram um delay (atraso) de 2 ou mais horas na chegada
f %>%
  filter(arr_delay > 120)

# b. Voaram p/ Houston (IAH ou HOU)
f %>%
  filter(dest == "IAH" | dest == "HOU")

# c. Partiram em julho, agosto ou setembro (meses 7, 8 ou 9)
f %>%
  filter(month == 7 | month == 8 | month == 9)

# d. Chegaram com um atraso maior que 2 horas, mas não saíram atrasados
f %>%
  filter(arr_delay > 120) %>%
  filter(dep_delay <= 0)

# e. partiram entre 12 pm e 6 am
f %>%
  filter(dep_time <= 600 & dep_time >= 0)

"
2 - Quais voos tem o horário de partida ausente ? 
"

f %>%
  filter(is.na(dep_time))

"
3 -  Vamos ordenar os voos p/ encontrar os que mais se atrasaram
"

f %>%
  arrange(desc(dep_delay ))

"
4 - Vamos ordenlar os voos que percorreram as maiores distâncias
"

f %>%
  arrange(desc(distance))

"
5 - Vamos buscar pelas variáveis que contem a palavra TIME
"

f %>%
  select(contains("time"))

"
6 - Vamos buscar pelas variáveis que terminam com a palavra DELAY
"

f %>%
  select(ends_with("delay"))
"
7 - Vamos adicionar duas colunas ao nosso taset, departed_hour (hora de partida)
e departed_minute (minuto de partida)
"

f2 <-  f %>%
  mutate(hora_de_partida = round(dep_time/100)) %>%
  mutate(minuto_de_partida = dep_time%%100)

head(f2)
"
8 - Vamos encontrar o atráso médio de partida por dia e o número de voos por dia
"

f3 <- f %>%
      group_by(year, month, day) %>%
      summarise(atraso_medio_em_minutos = mean(dep_delay, na.rm = TRUE), num_de_voos_por_dia = n()) 

head(f3)

"
Agora, vamos traçar o atraso médio de partida e suas ocorrências
"

ggplot(f3, aes(atraso_medio_em_minutos)) +
  geom_histogram() +
  xlab("Atraso médio (em minutos)") +
  ylab("Número de ocorrências")


"
9
"

# a. Vamos encontrar os voos não cancelados
nao_cancelados <- f %>%
  filter(!is.na(dep_delay)) %>%
  filter(!is.na(arr_delay))

# b. Vamos encontrar o atraso médio dos voos não cancelador por aviao
aviao <- nao_cancelados %>%
  group_by(tailnum) %>%
  summarise(Atraso_medio = mean(dep_delay), num_de_voos = n())

head(aviao)

"
Agora, vamos transformar em variáveis categóricas, para melhorar a visualização
"

aviao$tailnum <- factor(aviao$tailnum)
str(aviao)

# c. Plotar o resultado
ggplot(aviao, aes(Atraso_medio)) +
  geom_histogram() +
  xlab("Atraso médio (em minutos)") +
  ylab("Número de ocorrências")

# d.


# e.
ggplot(aviao, aes(x = num_de_voos , y = Atraso_medio)) +
  geom_point() +
  xlab("Atraso médio (em minutos)") +
  ylab("Número de ocorrências")


