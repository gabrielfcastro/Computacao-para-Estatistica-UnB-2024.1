df <- data.frame(
  nome = c("John","Paul","George","Ringo"),
  nascimento = c(1940,1942,1943,1940),
  instrumento = c("guitarra","baixo","guitarra","bateria")
)
df

df$n
df$banda <- c(TRUE,TRUE,TRUE,TRUE)
df

# Vamos extrair a segunda linha inteira --> df[coluna,linha]
df[1,]

# Agora, vamos extrair um elemento somente, por exemplo: o elemento que o Paul tocava
df[2,3]

# Vamos agora visualizar a linha 2 e 4 e a coluna 3
df[c(2,4),3]

# Vou extrair as linhas 2 a 4, e apenas a coluna 1, no caso deste df especificamente os nomes
df[2:4,1]

df[,"nascimento"]
