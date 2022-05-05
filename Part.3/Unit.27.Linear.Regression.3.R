# Unit 26. Linear Regression 3. 

windows(width = 7, height = 5)

?mtcars

str(mtcars)

df <- subset(mtcars, select = 1:6)
str(df)

cor(df)

library(car)
scatterplotMatrix(df, pch = 19, col = "steelblue", cex = 1.2,
                  regLine = list(method = lm, lwd = 2, col = "tomato"),
                  smooth = list(smoother = loessLine, spread = FALSE, 
                                lwd.smooth = 2, col.smooth = "orange"))

model <- lm(mpg ~ cyl + disp + hp + drat + wt, data = df)
summary(model)

model <- lm(mpg ~ hp + wt, data = df)
summary(model)

model <- lm(mpg ~ wt, data = df)
summary(model)

plot(model)

