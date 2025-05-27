library(RColorBrewer)

texas <- read.csv("texas.csv")
head(texas)

ggplot(texas, aes(long,lat)) + geom_point()
tx <- ggplot(texas, aes(long,lat)) + geom_polygon(aes(group = group, fill = bin))
tx + ggtitle("População do Texas")

tx + coord_map()

tx + scale_fill_brewer(palette = "Blues") +
  xlab("") +
  ylab("") +
  theme_bw() +
  coord_map() +
  ggtitle("População do Texas")

tx + scale_fill_grey( name = "Legend name", labels = c("1", "2", "3", "4","5"))

tx + scale_fill_brewer(palette = "Blues",
                       name = "População", 
                       labels = c("0 - 999", "10,000 - 99,000", "100,000 - 999,999","1,000,000+")) +
  xlab("") +
  ylab("") +
  theme_bw() +
  coord_map() +
  ggtitle("População do Texas")
