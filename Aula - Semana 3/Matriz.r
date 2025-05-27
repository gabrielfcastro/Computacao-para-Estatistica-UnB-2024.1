vet = c(6,5,4,3,2,1)
matrix_exemplo <- matrix(data = vet, nrow = 2)
matrix_exemplo

" 
Forma default do R é preencher por coluna --> nrow.
Porém, podemos fazer o preenchimento por linha, basta usar o byrow.
Além disso, note que em ambos os casos o R coloca na ordem que recebemos os parametros
"
# Preenchendo pelas colunas
matrix(c(1, 2, 3, 4, 5, 6), nrow = 3)

# Preenchendo pelas linhas
matrix(c(1, 2, 3, 4, 5, 6), nrow = 3, byrow = T)
