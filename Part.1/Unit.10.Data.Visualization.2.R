# Unit 10. Data Visualization (2) ggplot2

library(tidyverse)
library(ggplot2)
data(package = "ggplot2")

str(mpg)
head(mpg)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
    geom_point()

ggp <- ggplot(data = mpg, mapping = aes(x = displ, y = hwy))
ggp + geom_point(mapping = aes(shape = class))

ggp + geom_point(mapping = aes(color = class, size = class, alpha = 0.3))

ggp <- ggplot(Orange, aes(age, circumference, group = Tree, color = Tree))
ggp + geom_point() + geom_line()

ggp + geom_point(size = 3) + geom_line(size = 2, alpha = 0.7)

p <- ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
    geom_point(mapping = aes(color = class, alpha = 0.3))
p + geom_smooth(formula = y ~ x, method = "loess", )

p + facet_wrap(~ class, nrow = 2)
p + facet_grid(drv ~ cyl)

?diamonds
str(diamonds)

p <- ggplot(data = diamonds)
p + geom_bar(mapping = aes(x = cut), fill = "steelblue")

p + geom_bar(mapping = aes(x = cut, fill = clarity))

p + geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")
p + geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

p + geom_histogram(aes(x = price, fill = cut), binwidth = 500)

p + geom_boxplot(aes(x = cut, y = price), fill = "steelblue") +
    coord_flip()

ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) +
    geom_point(size = 2, alpha = 0.5, position = "jitter") +
    theme_classic() +
    ggtitle(label = "IRIS dataset", sub = "Petal.Length .vs. Petal.Width") +
    theme(plot.title = element_text(size = 25, face = 'bold', color = "tomato"),
          plot.subtitle = element_text(size = 14, face = 'italic', color = "darkblue"),
          axis.title = element_text(size = 18, color = "magenta"))

ggsave(filename = "figure.1.png", width = 7, height = 5)
ggsave(filename = "figure.1.pdf", width = 7, height = 5)
