# Unit 6. Data Frame

head(iris, n = 10)

v1 <- 1:7
v2 <- c('홍길동', '전우치', '주니온', '아사달', '아사녀', '연오랑', '세오녀')
v3 <- factor(c('M', 'M', 'M', 'M', 'F', 'M', 'F'))
df <- data.frame(no = v1, name = v2, sex = v3)
str(df)
head(df)

str(iris)
iris[1:5, ]
iris[1:5, 1:4]
iris[1:5, -5]
iris[, -c(1:4)]

iris$Sepal.Length
iris[, 1]
iris[, "Sepal.Length"]
iris$Species
iris[, 5]
iris[, "Species"]

iris[1, ]
class(iris[1, ])
class(iris[, 1])
class(iris$Species)

summary(iris$Sepal.Length)
iris[iris$Sepal.Length < 5.1, ]
iris[iris$Sepal.Length < 5.1 & iris$Species == 'versicolor', ]
with(iris, iris[Sepal.Length < 5.1 & Species == 'versicolor', ])

df <- iris
head(df, n = 3)
df$Sepal.Sum <- df$Sepal.Length + df$Sepal.Width
head(df, n = 3)

?state.x77
str(state.x77)
class(state.x77)
is.matrix(state.x77)
is.data.frame(state.x77)

df.x77 <- as.data.frame(state.x77)
is.data.frame(df.x77)
str(df.x77)

getwd()
write.csv(iris, file = "iris.csv")
write.csv(iris, file = "iris2.csv", row.names = F)

df1 <- read.csv(file = "iris.csv")
str(df1)
df2 <- read.csv(file = "iris2.csv", stringsAsFactors = T)
str(df2)

install.packages("readxl")
library(readxl)
df <- read_excel(path = "mydata.xlsx", sheet = 1)
str(df)
head(df)

# exercise 6.1

st <- data.frame(state.x77)
str(st)
summary(st)
mean(st$Income)
with(st, st[Population > 10000, c("Population", "Income")])
rownames(st)
with(st, st[rownames(st) == "Florida", c("Population", "Income")])

# exercise 6.2

with(st, st[Population < 1000 & Income < 5000, ])
df <- with(st, st[Income < 5000, ])
mean(df$Illiteracy)

mean(with(st, st[Income > 5000, ]$Illiteracy))

# exercise 6.3

library(readxl)
df <- read_excel("scores.xlsx", sheet = 1)
str(df)
head(df)
df$Sum <- df$Kor + df$Eng + df$Math
df$Mean <- (df$Kor + df$Eng + df$Math) / 3

write.csv(df, "result.csv", row.names = F)
