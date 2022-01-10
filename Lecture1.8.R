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

ggplot() +
    geom_smooth(mapping = aes(x=age, y=circumference), 
              data = Orange)

ggplot() + 
    geom_point(mapping=aes(x=displ, y=hwy), data=mpg) +
    geom_smooth(mapping=aes(x=displ, y=hwy), data=mpg)

ggplot(diamonds) + 
    geom_histogram(aes(depth))

ggplot(diamonds) + 
    geom_boxplot(aes(y = carat))

ggplot(diamonds) + 
    geom_boxplot(aes(cut, price))

ggplot(mpg, aes(class)) + 
    geom_bar(fill="dark blue")

ggplot(mpg, aes(class)) + 
    geom_bar(aes(fill=drv))


# 8.3

ggplot(data=iris,
       mapping=aes(x=Petal.Length, y=Petal.Width, color=Species)) +
    geom_point(size=3) +
    ggtitle("IRIS dataset") +
    theme(plot.title=element_text(size=25, face='bold', color='steelblue'))

p <- ggplot(mpg, aes(class)) + 
    geom_bar(aes(fill=drv))
ggsave(file="myplot.png", plot=p, width=5, height=4)

# 8.4
# Packages
library(ggplot2)
library(dplyr)

# create data
time <- as.numeric(rep(seq(1,7),each=7))
value <- runif(49, 10, 100)             
group <- rep(LETTERS[1:7],times=7)      
data <- data.frame(time, value, group)

# stacked area chart
ggplot(data, aes(x=time, y=value, fill=group)) + 
    geom_area()

