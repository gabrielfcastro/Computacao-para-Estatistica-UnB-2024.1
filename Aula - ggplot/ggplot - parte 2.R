ggplot(diamonds, aes(x = color)) + geom_bar(aes(fill = cut), position = "identity")


ggplot(diamonds, aes(x = price)) + geom_histogram(binwidth = 2000, fill = "blue", alpha = 0.4, color = "black")

