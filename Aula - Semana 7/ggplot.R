library(ggplot2)
ggplot(data = iris) +
  geom_point(mapping = aes( x = Sepal.Width, y = Sepal.Length) )

"

aes (aesthetic) = seria equivalente aos eixos/dimensões/variáveis

"

mean(iris$Sepal.Length) # Posso ainda escrever, ou seja, omitir o nome dos argumentos
mean(x = iris$Sepal.Length)

# 1
ggplot(mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# 2
ggplot(mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

# 3
ggplot(mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# 4
ggplot(mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Colocando quantas eu quiser
ggplot(mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class, shape = fl))


ggplot(mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")


ggplot(mpg) +
  geom_point( aes(x = displ, y = hwy) ) +
  facet_grid(.~cyl) # y em função de ...
 # categorias alinhadas, por niveis, em uma mesma dimensão


ggplot(mpg) +
  geom_point( aes(x = displ, y = hwy) ) +
  facet_wrap(~class)
# categorias alinhadas, por sequências, em uma mesma dimensão
