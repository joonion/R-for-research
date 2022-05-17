# Unit 1. R and RStudio

print('Hello, R!')
x <- 10
x

y <- 20
y

z <- x + y
z

getwd()

data()

View(iris)

plot(iris)

?plot

library(fortunes)
fortune()

install.packages("cowsay")
library(cowsay)
say('Hello, World!')
?say
say('Hello, Chicken, R!', by = 'chicken')
