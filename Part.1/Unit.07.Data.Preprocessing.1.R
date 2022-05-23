# Unit 7. Data Preprocessing (1) Missing Values and Anormalies 

x <- c(45, NA, 87, 63, 55, NA, 72, 61, 59, 68)
x

mean(x)
mean(x, na.rm = T)

var(x, na.rm = T)
sd(x, na.rm = T)

x <- c(45, NA, 87, 63, 55, NA, 72, 61, 59, 68)
is.na(x)
x[is.na(x)]
x[!is.na(x)]

x[is.na(x)] <- mean(x, na.rm = T)
x

?airquality
str(airquality)

df <- airquality
complete.cases(df)
df[complete.cases(df), ]
df[!complete.cases(df), ]

sum(is.na(df$Ozone))
sum(is.na(df$Solar.R))
sum(is.na(df$Solar.R) & is.na(df$Ozone))

sum(!complete.cases(df))
mean(!complete.cases(df))

library(VIM)
?VIM
?aggr
aggr(airquality, prop = F, numbers = T, sortVar = T)

airquality[complete.cases(airquality), ]
df <- na.omit(airquality)
str(df)
nrow(airquality[complete.cases(airquality), ])

library(mice)
?mice

result <- mice(airquality, method="mean", m = 2, maxit = 2)
result$imp$Ozone
result$imp$Solar.R
result$imp$Wind

df <- data.frame(state.x77)
?boxplot
boxplot(df$Income)
boxplot(df$Income, pch = 19, col = "orange", border = "brown")

boxplot.stats(df$Income)
outlier <- boxplot.stats(df$Income)
df[df$Income == outlier$out, ]

df <- data.frame(state.x77)
nrow(df)
df[df$Income == outlier$out, ] <- NA
df[!complete.cases(df), ]
df.no.outlier <- na.omit(df)
nrow(df.no.outlier)

boxplot(Petal.Width ~ Species, data = iris, 
        pch = 19, col = "orange", border = "brown")

df <- with(iris, iris[Species == "setosa", ])
boxplot.stats(df$Petal.Width)
outlier <- boxplot.stats(df$Petal.Width)$out
df[df$Petal.Width %in% outlier, ] <- NA
df.no.outlier <- na.omit(df)
nrow(df.no.outlier)


# exercise 7.1

library(mice)
?nhanes
str(nhanes)
nhanes[complete.cases(nhanes), ]
nhanes[!complete.cases(nhanes), ]

sum(is.na(nhanes$bmi))
sum(is.na(nhanes$hyp))
sum(is.na(nhanes$chl))

library(VIM)
aggr(nhanes, prop = F, numbers = T, sortVar = T)


# exercise 7.2
boxplot(Petal.Length ~ Species, data = iris, 
        pch = 19, col = "orange", border = "brown")

df.set <- iris[iris$Species == "setosa", ]
df.ver <- iris[iris$Species == "versicolor", ]
out.set <- boxplot.stats(df.set$Petal.Length)$out
out.set
out.ver <- boxplot.stats(df.ver$Petal.Length)$out
out.ver
df <- iris
df[df$Petal.Length %in% out.set, ] <- NA
df[df$Petal.Length %in% out.ver, ] <- NA
df[!complete.cases(df), ]
df.na.omit <- na.omit(df)
str(df.na.omit)
df[!complete.cases(df.na.omit), ]
