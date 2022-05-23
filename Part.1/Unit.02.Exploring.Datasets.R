# Unit 2. Exploring Datasets

?iris

str(iris)

head(iris)
tail(iris)

class(iris$Species)

levels(iris$Species)

table(iris$Species)

barplot(table(iris$Species))

class(iris$Petal.Length)

mean(iris$Petal.Length)

var(iris$Petal.Length)

sd(iris$Petal.Length)

hist(iris$Petal.Length)
hist(iris$Petal.Length, col = 'steelblue')
hist(iris$Petal.Length, col = 'steelblue', 
     main = '꽃잎의 길이에 대한 히스토그램', 
     xlab = '꽃잎의 길이',
     ylab = '빈도수')

?mtcars

str(mtcars)

mtcars$mpg

mtcars$wt

summary(mtcars)

hist(mtcars$mpg, col = 'steelblue')
hist(mtcars$wt, col = 'orange')
hist(mtcars$wt, col = 'orange', 
     xlim = c(1, 6),
     ylim = c(0, 10))

plot(mtcars$mpg, mtcars$wt)
plot(mtcars$mpg, mtcars$wt, pch = 19)
plot(mtcars$mpg, mtcars$wt, pch = 19, col = 'tomato')

# exercise 2.1

barplot(table(iris$Species), col = "tomato")
barplot(table(iris$Species), col = "tomato", 
        main = "품종의 막대그래프",
        xlab = "품종", ylab = "개수")

# exercise 2.2

mean(iris$Petal.Width)
var(iris$Petal.Width)
sd(iris$Petal.Width)

hist(iris$Petal.Width)
hist(iris$Petal.Width, col = "tomato", 
     main = '꽃잎의 너비에 대한 히스토그램', 
     xlab = '꽃잎의 너비',
     ylab = '빈도수')

# exercise 2.3

hist(mtcars$hp, col = 'steelblue', 
     xlim = c(0, 400), ylim = c(0, 12))

plot(mtcars$hp, mtcars$mpg, pch = 3, col = 'tomato')

# exercise 2.4

str(cars)
summary(cars)
plot(cars$speed, cars$dist, pch = 4, col = 'tomato',
     xlim = c(0, 30), ylim = c(0, 150))
