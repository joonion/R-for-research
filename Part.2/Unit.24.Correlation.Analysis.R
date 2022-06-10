# Unit 24. Correlation Analysis

library(MASS)
str(cats)

plot(cats$Hwt ~ cats$Bwt,
     main="Body Weight and Heart Weight of Cats",
     col="forestgreen", pch=19,
     xlab="Body Weight (kg)", 
     ylab="Heart Weight (g)")


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
pairs.panels(state.x77, 
             main="Correlation Plot of US States Data",
             bg="red", 
             pch=21, 
             hist.col="gold")


library(corrgram)
corrgram(state.x77, 
         main="Corrgram of US States Data",
         order=TRUE, 
         lower.panel=panel.shade, 
         upper.panel=panel.pie, 
         text.panel=panel.txt)


library(corrgram)
cols <- colorRampPalette(c("darkgoldenrod4", "burlywood1", "darkkhaki", "darkgreen"))
corrgram(state.x77, 
         main="Corrgram of US States Data",
         order=FALSE, 
         col.regions=cols,
         lower.panel=panel.pie, 
         upper.panel=panel.conf, 
         text.panel=panel.txt)


select <- c("mpg", "hp", "cyl", "wt")
df <- mtcars[, select]
cor(df)

library(ggm)
pcor(select, cov(df))
pcor.test(pcor(select, cov(df)), q = 2, n = nrow(df))

library(ppcor)
pcor(df)
pcor(test)
