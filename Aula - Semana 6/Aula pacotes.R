x <- c(1,2,3,4,5)

# 1 - Maior que 
x > 3
# 2 - Igual a
x == 3

# Agora, vamos saber se um valor pertence
1 %in% x

c(3,4,5,6) %in% x

# Vamos exemplificar o uso de operadores boolenados
xor(7 > 2,7 < 9)

w <- c(-1, 0, 1)
w >= 0

"
Vamos especificar como funciona, vamos primeiro comparar o 5 e depois o 15, 
5 ñ é menor que 10 logo é FALSE enquanto 15 é maior que 10 logo é TRUE,
fazemos um AND com FALSE e TRUE, o resuktado é FALSE. Para o menor que 20 
ocorre a mesma coisa
"

x <- c(5,15)
x > 10 & x < 20

y <- "Fevereiro"
y == "Fevereiro"

z <- c("Segunda","Quinta","Sexta")
all(z == "Segunda" | z == "Terça" | z == "Quarta" | z == "Quinta" | 
      z == "Sexta" | z == "Sábado" | z == "Domingo")

dias_da_semana <- c("Segunda" ,"Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo")
all(z %in% dias_da_semana)

b <- c(1,2,3,4,NA)
sum(b)
sum(b,na.rm = TRUE)
