#2a) Vamos criar uma sequência de 1 a 40 em um vetor chamado x
x = seq(1, 40, 1)
x

#2b) Agora vamos criar mais dois vetores x (somente com os numeros pares) e y (somente com os numeros impares)
x = seq(2,40,2)
x
y = seq(1,40,2)
y

#2c) Crie um data frame cuja primeira coluna é o vetor x (nomeie essa coluna de x) e cuja segunda coluna é o vetor y (nomeie essa coluna de y)
df <- data.frame(x,y)
df

# Trocando agora o nome das colunas
names(df) <- c("Coluna x (Par)","Coluna y(Impar)")
df

# 2d) Iremos resolver essa questão de dois modos diferentes

# O modo 1 consiste em fazer um for com todas as linhas meu dataframe
for (i in 1:nrow(df))
{
    # Faço um for percorrendo todas as linhas do meu dataframe
    distancia = ( x[i]^2 + y[i]^2 )^0.5
    # Caso essa distância seja menor que 30, estará dentro do raio
    if (distancia <= 30)
    {
        cat(sprintf("TRUE (As coordenadas (%d, %d) estão DENTRO do raio)\n", x[i], y[i]))

    }
    # Caso esteja fora
    else
    {
        cat(sprintf("FALSE (As coordenadas (%d, %d) estão FORA do raio)\n", x[i], y[i]))
    }
}