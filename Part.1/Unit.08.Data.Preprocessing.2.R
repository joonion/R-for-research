# Unit 8. Data Preprocessing (2) Handling Data

windows(width = 7, height = 5)

summary(iris)

subset(iris, select = c(1, 2, 5))
subset(iris, subset = Species == "setosa")
subset(iris, subset = Sepal.Length > 7.5)
subset(iris, subset = Sepal.Length > 7.5 & Sepal.Width > 3.0)
subset(iris, 
       subset = Sepal.Length > 7.5 & Sepal.Width > 3.0,
       select = c(1, 2, 5))

?split
split(iris, f = iris$Species)
df <- split(iris, f = iris$Species)
names(df)
summary(df)
df$setosa
df$versicolor
df$virginica

df <- subset(iris, select = c(1, 2))
aggregate(df, by = list(Species=iris$Species), FUN = length)
aggregate(df, by = list(Species=iris$Species), FUN = mean)
aggregate(df, by = list(Species=iris$Species), FUN = sd)

str(mtcars)
df <- subset(mtcars, select = c("mpg", "cyl", "gear"))
aggregate(df, by = list(cyl=mtcars$cyl, gear=mtcars$gear), 
          FUN = mean)

df.split <- split(iris, f = iris$Species)
df.rbind <- rbind(df.split$setosa, df.split$virginica)
str(df.rbind)

df.sepal <- subset(iris, select = c(1, 2))
str(df.sepal)
df.petal <- subset(iris, select = c(3, 4))
str(df.petal)
df.cbind <- cbind(df.sepal, df.petal)
str(df.cbind)

x <- data.frame(name = c('A', 'B', 'C'), kor = c(60, 70, 80))
y <- data.frame(name = c('A', 'B', 'D'), eng = c(65, 75, 85))
cbind(x, y)
merge(x, y)
merge(x, y, all = T)
merge(x, y, all.x = T)
merge(x, y, all.y = T)

x <- data.frame(name = c('A', 'B', 'C'), kor = c(60, 70, 80))
y <- data.frame(NAME = c('A', 'B', 'D'), eng = c(65, 75, 85))
merge(x, y)
merge(x, y, by.x = "name", by.y = "NAME")
merge(x, y, by.x = "name", by.y = "NAME", all = T)

sort(mtcars$mpg)
sort(mtcars$mpg, decreasing = T)

?order
order(mtcars$mpg)
ord <- order(mtcars$mpg, decreasing = T)
mtcars[ord, 1:6]
mtcars[ord[1:10], 1:6]
n <- length(ord)
mtcars[ord[(n-10):n], 1:6]

ord <- order(iris$Petal.Length, iris$Sepal.Length)
head(iris[ord, c(3, 1)])
ord <- order(iris$Petal.Length, -iris$Sepal.Length)
head(iris[ord, c(3, 1)])



