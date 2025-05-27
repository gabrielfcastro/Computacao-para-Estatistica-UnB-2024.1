# 3a) Iremos criar o vetor a seguir com 1 observação faltante (NA): x = 10, 20, 30, N A.
x <- c(10,20,30,NA)
x

# 3b) Vamos calcular a média do nosso vetor
# Utilizando o comando mean
media <- mean(x)
media

# Calculando no "braço"
media_braco = (sum(x)/length(x))
media_braco

" Note que o R é incapaz de calcular a média do nosso vetor x, isso ocorre por conta do elemento NA. Este representa a ausência de um parâmetro.
Logo, o R é incapaz de fazer essa soma
"

?mean()

"
Para sermos capaz de realizar essa operação, precisamos mudar o parametro NA, por um valor lógico. Seja TRUE seja FALSE. A fim de demonstrações
iremos utilizar ambos. O valor lógico TRUE será tratado como 1, enquanto o valor lógico FALSE como 0
"
x <- c(10,20,30,TRUE)
x <- c(10,20,30,FALSE)