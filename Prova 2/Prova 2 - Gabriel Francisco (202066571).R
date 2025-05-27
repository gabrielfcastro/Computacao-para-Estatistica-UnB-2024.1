"
Aluno: Gabriel Francisco de Oliveira Castro
Matrícula: 202066571
"

# Preparando o ambiente
library(ggplot2)
library(tidyverse)

# Primeiro, vamos baixar o banco de dados uptake
bd <- CO2
head(bd)

"
1 - Iremos adicionar uma nova coluna chamada uptake0, qual irá conter o número inteiro
mais proximo da taxa de absorção de CO2 (variável uptake), em seguida iremos ordenar essa 
coluna da maior para a menor taxa de abosorção de CO2.
"

bd <- bd %>%
  mutate(uptake0 = round(uptake)) %>%
  arrange(desc(uptake0))
head(bd)

"
2 - Iremos acrescentar no nosso banco de dados bd uma nova coluna referente ao tamanho das plantas,
porém o banco de dados não contém o tamanho das plantas Mc2 e Mc3. Por causa disso,irá resultar 
em NAs nos tamanhos referentes as plantas mencionadas anteriormente.quandoo utilizarmos o método left_join.
"

info <- data.frame(Plant = levels(CO2$Plant)[-11], Size = 1:11)
bd <- left_join(bd, info)
head(bd)

"
3 - Agora, iremmos calcular a taxa média de absorção de CO2 p/ cada tratamento
"

bd %>%
  group_by(Treatment) %>%
  summarise(Taxa_media_de_absorcao = mean(uptake, na.rm = TRUE))

"
4 - Nessa questão, iremos fazer um gráfico de dispersão de Concetraçaõ de CO2 (conc) x Taxa de absorção de CO2
(uptake), acrescentando se houve ou não frio aplicado (Treatment).
"

ggplot(bd, aes(x = conc, y = uptake)) +
  geom_point(aes(color = Treatment))

"
A partir do esboço do gráfico podemos observar que as plantas não submetidas ao resfriamento tendem a ter
uma taxa de absorção de CO2 maior quando comparadas com aquelas que foram submetidas ao resfriamento.
"

"
5 - Iremos refazer o gráfico anterior adicionando título e alterando para português o rótulo dos eixos x, y e 
legenda.
"

ggplot(bd, aes(x = conc, y = uptake)) +
  geom_point(aes(color = Treatment)) +
  xlab("Concentração de CO2 no ambiente") +
  ylab("Taxa de absorção de CO2") +
  ggtitle("Concentração de CO2 no ambiente x Taxa de absorção de CO2") +
  scale_color_discrete(name = "Tratamento", labels = c("Não submetidos ao resfriamento", "Subtmetidos ao resfriamento"))

"
6 - Por fim, iremos alterar a cor dos pontos para laranja (plantas não resfriadas) e azul (plantas resfriadas).
"

ggplot(bd, aes(x = conc, y = uptake)) +
  geom_point(aes(color = Treatment)) +
  scale_color_manual(aes(values = c(nonchilled= "orange", chilled = "blue")))

