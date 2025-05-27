"1) Nosso primeiro passo é alterar o nome das variáveis para português, 
ou seja, irmeos alterar o nome das colunas"

base_de_dados <- airquality
base_de_dados

names(base_de_dados) <- c("Ozonio", "Radiação Solar", "Vento", "Temperatura (F)", "Mês", "Dia")
base_de_dados


"2) Em seguida, iremos extrair o conteúdo da linha 20"

base_de_dados[20,]

"3) Iremos substituir da intersecção entre a linha 20 e a coluna do vento (3) por NA, ou seja,
substituiremos o valor da coluna 20 referente ao vento por NA
"

base_de_dados[20,3]
base_de_dados[20,3] <- NA

"4) Vamos calcular o vento médio da nossa base de dados"

base_de_dados$Vento

?mean
media_da_coluna_do_vento = mean(base_de_dados$Vento, na.rm = TRUE) # Observe que colocando esse parâmetro na.rm = TRUE, eu ignoro os dados inválidos para meu cálculo
media_da_coluna_do_vento

"5) Vamos criar uma nova coluna em nossa base de dados indicando se a temperatura foi maior que 75 F"

nova_coluna = base_de_dados$`Temperatura (F)` > 75
nova_coluna
base_de_dados$"Temperatura maior que 75F" <- nova_coluna
base_de_dados

"Vamos tentar ainda de outras duas maneira, usando uma quantidade menor de linhas"
#1
base_de_dados$"Temperatura maior que 75F" <- base_de_dados[,4] > 75
base_de_dados

#2
base_de_dados$"Temperatura maior que 75F" <- base_de_dados$`Temperatura (F)` > 75
base_de_dados

"6) Vamos criar um banco de dados contendo apenas as informações (todas as colunas) dos dias nos quais a temperatura foi maior que 75 F"

nova_base_de_dados <- base_de_dados[base_de_dados$`Temperatura (F)`>75,]
nova_base_de_dados


"7) Vamos transformar a nossa nova base de dados em uma matriz"

mat <- as.matrix(nova_base_de_dados)
mat

?matrix

" Observe que os valores que antes eram uma coluna de TRUE foram transformados em 1, isso ocorre
  porque a matriz transformar valores l[ogicos em 0 e 1
  
"

"8) Calculamos por fim as dimensões da nossa matriz"

dimensao = dim(mat)
dimensao
