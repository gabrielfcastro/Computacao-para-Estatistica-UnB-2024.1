# Preparando o ambiente
library(nycflights13)
library(tidyverse)
library(ggplot2)

voos <- flights

# 1a - Chegaram c/ delay de duas ou mais horas
voos %>%
  filter(arr_delay >= 120)

# 1b - Voaram p/ IAH ou HOU
voos %>%
  filter(dest == "IAH" | dest == "HOU")

# 1c - Sairam no verão (July (7), Agosto (8) ou Setembro (9))
voos %>%
  filter(month == 7 | month == 8 | month == 9)

# 1d - Saíram mais de 2 horas atrasados, mas não chegaram atrasados
voos %>%
  filter(dep_delay >= 120) %>%
  filter(arr_delay <= 0)

# 1e - Partiram entre meia noite e 6 da manha
voos %>%
  filter(dep_time >= 0 & dep_time <= 600)

# 2 - Quais voos tem o tempo de partida faltando
voos %>%
  filter(is.na(dep_time))

# 3 - Organize os voos p/ encontrar o que mais se atrasou
voos %>%
  arrange(desc(dep_time))

# 4 - Quais voos voaram o mais longe
voos %>%
  arrange(desc(distance))

# 5 - Selecione as variáveis que tem a palavra time
voos %>%
  select(contains("time"))

# 6 - Selecione as variáveis que terminam com a palavra delay
voos %>%
  select(ends_with("delay"))

# 7 - Adicione duas colunas ao dataset HORA QUE PARTIU e MINUTO QUE PARTIU
voos_modificado <- voos %>%
  mutate(
    hora_de_partida = round(dep_time/100),
    minuto_de_partida = dep_time%%100
         )

# 8 - 
# 8a. Encontre o atraso médio de partida por dia e o número de voos por dia
atraso_medio_e_num_de_voos <- voos %>%
  group_by(year, month, day) %>%
  summarise(atraso_medio = mean(dep_delay, na.rm = TRUE), num_de_voos = n())

# 8b. 
ggplot(atraso_medio_e_num_de_voos, aes(x = atraso_medio)) +
  geom_histogram()

#9
# 9a - Encontre os voos não cancelados (departure delay is not NA and arrival delay is not NA)
voos_nao_cancelados <- voos %>%
  filter(!is.na(dep_delay) & !is.na(arr_delay))

# 9b - Descubra o atraso médio de partida por aviao
voos_nao_cancelados %>%
  group_by(tailnum) %>%
  summarise(atraso_medio = mean(dep_delay))

# 9c - Plote o resultado anterior
voos_nao_cancelados %>%
  group_by(tailnum) %>%
  summarise(atraso_medio = mean(dep_delay)) %>%
  ggplot(aes(x = atraso_medio)) +
  geom_histogram()

# 9d - Adicione a tabela o número de contagens
voos_nao_cancelados %>%
  group_by(tailnum) %>%
  summarise(atraso_medio = mean(dep_delay), num_de_voos = n())

# 9e - Plote um gráfico CONTAGEM x Atraso médio
voos_nao_cancelados %>%
  group_by(tailnum) %>%
  summarise(atraso_medio = mean(dep_delay), num_de_voos = n()) %>%
  ggplot(aes(x = num_de_voos, y = atraso_medio)) +
  geom_point()

