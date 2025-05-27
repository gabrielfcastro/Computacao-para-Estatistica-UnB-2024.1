lst <- list(c(1,2), TRUE, c("a","b","c"))
lst

# Vamos extrair um elemento da minha lista, nesse caso quero extrair os elementos de posição 1 e 2
lst[c(1,2)]

# Vamos extrair um elemento apenas 1 elemento
lst[3]

# Quando uso um [] só o resultado será uma lista, enquanto dois [] será o resultado interno, observe a seguir:
lst[[3]]

# Agora, vou pegar do primeiro vagão irei extrar o elemento 2
lst[[1]][2]

vet <- c(6,1,3,6,10,5)
vet

# Vamos extrair usando TRUE ou FALSE
vet[c(FALSE,TRUE,TRUE,FALSE,FALSE,TRUE)] 

"
    Ñ quero, quero, quero, Ñ quero, Ñ quero, quero
        6       1     3       6         10      5
"

# Vamos extrar usando negativo, nesse caso vamos tirar tudo menos os elementos 2 e 5
vet[-c(2,5)]


mat <- matrix(c(1,2,3,4,5,6,7,8,9),nrow = 3)
mat
mat[c(TRUE,FALSE,TRUE)]

mat <- matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, byrow = TRUE)
mat

# Linha primeiro SEMPRE
# Vamos extrair da primeira e segunda linha, menos a coluna 3
mat[c(1,2),-3]


# Extraindo elementos
names(vet) <- c("a","b","c","d","e","f")
vet[c("a","b","c")]


lst <- list(c(1,2), TRUE, c("a","b","c"))
names(lst) <- c("numero","logico","letra")
lst["numero"]
lst$letra

lst[c("numero","letra")]

vet <- -10:4
vet
# Quero saber quais elementos são positivo, para então extrair eles
vet[vet>0]
