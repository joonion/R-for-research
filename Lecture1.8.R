# 8.1
install.packages("tidyverse")
install.packages("ggplot2")

library(ggplot2)

# 8.2
ggplot() +
    geom_point(mapping = aes(x=displ, y=hwy), 
               data = mpg)

ggplot() +
    geom_point(mapping = aes(x=displ, y=hwy, color=class), 
               data = mpg)

ggplot() +
    geom_point(mapping = aes(x=displ, y=hwy, shape=class), 
               data = mpg)

ggplot() +
    geom_point(mapping = aes(x=displ, y=hwy, alpha=class), 
               data = mpg)


ggplot() +
    geom_line(mapping = aes(x=age, y=circumference, group=Tree, color=Tree), 
              data = Orange)

