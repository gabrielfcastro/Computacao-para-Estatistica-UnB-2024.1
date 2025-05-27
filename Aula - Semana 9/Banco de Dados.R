library(tidyverse)

df_novo <- data.frame(
  Cor = c("Ocean", "Ice", "Sky", "Night", "Aqua"), 
  Valor = c(4,1,2,5,3)
)
df_novo



arrange(df, Valor)

df <- data.frame(
  Cor = c("Branco", "Branco", "Azul", "Azul", "Azul"), 
  Valor = 1:5
  )

df

df[df$Cor == "Azul",]

filter(df, Cor == "Azul")

filter(df, Valor %in% c(2,4))
filter(df, Valor == 2 | Valor == 4)

" %>% ->  FAÇA ISSO"
" Com o DF filtre a cor azul e em seguida selecione apenas a coluna valor "

df2 <- df %>% filter(Cor == "Azul") %>% select(Valor)
df2

bnames <- read.csv("bnames.csv")

" Filtrar meninas que o ano terminam com 00 e mostre as 6 primeiras linhas "
bnames %>% filter(sex == "girl" & (year == 1900 | year == 2000)) %>% head()

df %>% select(!Cor)

" Filtra tudo menos a coluna soundex e mostra as 6 primeiras"
bnames %>% select(!soundex) %>% head()

bnames %>% filter(name == "Gabriel") %>% 
  arrange(desc(prop)) %>% 
  head() 

mutate(df, Dobro = 2 * Valor, Quadruplo = 2 * Dobro)
df %>% mutate(Dobro = 2 * Valor, Quadruplo = 2 * Dobro)

df
summarise(df, Total = sum(Valor))
df %>% summarise(Total = sum(Valor), Media = mean(Valor), Desvio = sd(Valor), Quantil = quantile(Valor,0.25)) %>% view()

Gabriel <- bnames %>% filter(name == "Gabriel") %>% 
  mutate( Porcentatem = prop*1000)

Gabriel %>% summarise(Min = min(Porcentatem), Media = mean(Porcentatem), Max = max(Porcentatem))
