# Note que charecter e string ñ tem diferença no R
str = "Olá mundo!"
class(str)

# Números de caracter (espaço tbm conta um caractere)
nchar(str)

vet = c(6,5,4,3,2,1)
class(vet)

str1 = "Olá"
str2 = "mundo!"

paste(str1,str2)

nfac <- c("F", "M", "F")
nfac
class(nfac)
# A função factor transforma a variável em uma variável categórica
fac <-(c("Feminino", "Masculino", "Feminino"))
fac
class(fac)


vet <- c(1,"R", TRUE)
vet

# Quando somo um vetor de VERDADEIROS e FALSOS estou retornado o número de VERDADEIROS
# A média indica a proporção de VERDADEIROS e FALSOS

TRUE + 5    

lst <- list(1, "R", TRUE)
class(lst)
lst

df <- data.frame(c(4,5,6), c("R","S","T"), c(TRUE, FALSE, TRUE))
df
class(df)

nvet <- c(um = 1, dois = 2, tres = 3)
names(nvet) <- c("one", "two", "three") # Alterando os nomes
nvet

ndf <-data.frame( numeros = c(1,2,3), 
                letras = c("R","S", "T"), 
                logicos = c(TRUE, FALSE, TRUE) )

ndf
names(ndf) <- c("numbers", "letter", "logical")
ndf