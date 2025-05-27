" 
Questão 1a)
"
# 2 0 2 0 6 6 5 7
matricula <- c(2,0,2,0,6,6,5,7)
matricula

" 
Questão 1b)
"

mat <- matrix(matricula, nrow = 2, ncol = 4, byrow = TRUE)
mat

"
Façamos uma pequena observação que byrow igual a TRUE começo a preencher pelas linhas, 
caso contrário pelas colunas
"

"
Questão 2a)
"

x <- seq(1,40)
x

"
Questão 2b)
"

x <- seq(1,39,2)
y <- seq(2,40,2)
x;y


"
Questão 2c)
"

df <- data.frame(x,y)
df

names(df) <- c("Coluna X (Ímpar)", "Coluna Y (Par)")
df

"
Questão 2d)
"


distancia <- sqrt((df$`Coluna X (Ímpar)`^2 + df$`Coluna Y (Par)`^2))
nova_coluna <- distancia <= 30
df$"Pertence ao interior da circunferência de 30 m" <- nova_coluna
df

"
Questão 3a)
"

vet <- c(10,20,30,NA)
vet

"
Questão 3b)
"

media <- mean(vet)
media

"
Questão 3c)
"

media <- mean(vet, na.rm = TRUE)
media
