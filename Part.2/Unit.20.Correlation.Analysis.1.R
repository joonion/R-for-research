# Unit 17. Correlation Analysis

set.seed(2022)
x <- runif(n = 100, min = 0, max = 100)
y <- runif(n = 100, min = 0, max = 100)
plot(x, y, pch = 19, col = "tomato")

set.seed(2022)
x <- runif(n = 100, min = 0, max = 100)
y <- x + runif(100, -30, 30)
plot(x, y, pch = 19, col = "tomato")


library(MASS)
str(cats)

plot(cats$Hwt ~ cats$Bwt)
plot(cats$Hwt ~ cats$Bwt, pch = 19, col = "forestgreen")

cor(cats$Hwt, cats$Bwt)
with(cats, cor(Hwt, Bwt))

with(cats, cor(Hwt, Bwt, method = "pearson"))
with(cats, cor(Hwt, Bwt, method = "spearman"))
with(cats, cor(Hwt, Bwt, method = "kendall"))

with(cats, cor.test(Bwt, Hwt))
with(cats, cor.test(Bwt, Hwt), alternative = "greater")
with(cats, cor.test(Bwt, Hwt), conf.level = 0.99)

cor.test(~ Bwt + Hwt, data = cats)
cor.test(~ Bwt + Hwt, data = cats, subset = (Sex == "F"))
cor.test(~ Bwt + Hwt, data = cats, subset = (Sex == "M"))

str(iris)
cor(iris[, -5])

iris.cor <- cor(iris[, -5])
iris.cor["Petal.Width", "Petal.Length"]

library(psych)
corr.test(iris[, -5])
print(corr.test(iris[, -5]), short = F)

old.opt <- options(digits = 2)
cor(state.x77)
options(old.opt)
options()$digits

library(psych)
pairs.panels(state.x77)
pairs.panels(state.x77, pch = 19, bg = "blue", hist.col = "red")

library(corrgram)
corrgram(state.x77)
corrgram(state.x77, order = T,
         upper.panel = panel.pie)

library(corrgram)
cols <- colorRampPalette(c("darkgoldenrod4", "burlywood1", "darkkhaki", "darkgreen"))
corrgram(state.x77, order = T,
         col.regions = cols,
         upper.panel = panel.conf)

select <- c("mpg", "hp", "cyl", "wt")
df <- mtcars[, select]
cor(df)

library(ggm)
pcor(select, cov(df))
pcor.test(pcor(select, cov(df)), q = 2, n = nrow(df))

library(ppcor)
pcor(df)
pcor(test)
