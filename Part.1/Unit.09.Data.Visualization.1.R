# Unit 9. Data Visualization (1) Basic Graphs

str(cars)
plot(cars)
plot(cars, pch = 19)
plot(cars, pch = 19, col = "tomato")
hist(cars$speed, breaks = 10, col = "steelblue")

plot(cars, pch = 19, col = "tomato")
coefficients(lm(dist ~ speed, data = cars))
abline(-17.579, 3.932)
abline(-17.579, 3.932, col = "darkblue")
abline(-17.579, 3.932, col = "darkblue", lwd = 3, lty = 3)
text(x = 5, y = 100, labels = "cars dataset", pos = 4)

plot(iris[, c(3, 4)], 
     main = "Scatter Plot for the IRIS dataset",
     sub = "This plot shows that the width of Petal grows as the length of Petal grows",
     xlab = "The Length of Petal",
     ylab = "The Width of Petal",
     type = 'b', pch = 19, lty = 3, las = 3,
     col = "steelblue", col.main = "tomato", col.sub = "darkblue", 
     col.lab = "magenta", col.axis = "brown")
    
colors <- as.integer(iris$Species) + 1
plot(iris[, c(3, 4)], pch = 19, col = colors)
legend(x = 1.2, y = 2.3, 
       legend = as.character(levels(iris$Species)),
       pch = 19, col = 2:4)

par(mfrow = c(1, 2))
plot(iris[, c(1, 2)], pch = 19, col = colors,
     main = "Sepal", col.main = "tomato")
plot(iris[, c(3, 4)], pch = 19, col = colors,
     main = "Petal", col.main = "tomato")
par(mfrow = c(1, 1))

tab <- table(subset(mtcars, select = c("cyl", "gear")))
tab
colors <- c("darkblue", "steelblue", "skyblue")
par(mfrow = c(1, 2))
barplot(tab, main = "Stacked Bar Plot", col = colors)
barplot(tab, main = "Grouped Bar Plot", col = colors, beside = T)
par(mfrow = c(1, 1))

hist(iris$Sepal.Length, col = "skyblue", density = 30, labels = T,
     prob = T, xlim = c(4, 8), ylim = c(0, 0.5), breaks = seq(4, 8, 0.4))

lines(density(iris$Sepal.Length), col = "tomato", lwd = 2, lty = 2)

?Orange
str(Orange)

table(Orange$Tree)
df <- as.data.frame(subset(Orange, Tree == 1))
plot(circumference ~ age, data = df, type = "b", pch = 19, col = "orange")

df.split <- split(Orange, f = Orange$Tree)
df.2 <- df.split$`2` 
lines(df.2$age, df.2$circumference, type = "b", pch = 19, col = "tomato")


xlim <- range(Orange$age)
ylim <- range(Orange$circumference)
plot(xlim, ylim, type = 'n', las = 1, 
     main = "The Growth of Orange Trees",
     xlab = "Age (days)", ylab = "Circumference (mm)")     

n <- length(levels(Orange$Tree))
for (i in 1:n) {
    df <- subset(Orange, Tree == i)
    lines(df$age, df$circumference, type = 'b', 
          pch = 19, lwd = 2, lty = i, col = i + 1)
}

legend(100, 200, legend = c("Tree 1", "Tree 2", "Tree 3", "Tree 4", "Tree 5"),
       col = 2:(n+1), pch = 19, lty = 1:n)
