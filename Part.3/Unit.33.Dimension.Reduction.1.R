# Unit 33. Dimension Reduction 1. Principal Component Analysis

str(state.x77)
colnames(state.x77)

prcomp(state.x77)
prcomp(state.x77, scale = T)

pca <- prcomp(state.x77, scale = T)
summary(pca)

plot(pca, type = 'l', col = "tomato", pch = 19)
round(pca$rotation, 3)
pca$x
pca$x[, c(1, 2)]
round(pca$x[, c(1, 2)], 3)
cor(pca$x)
round(cor(pca$x), 12)

par(mai=c(0.9,0.1,0.7,0.1))
biplot(pca, cex = c(0.5, 0.75))
?biplot

# MDS

str(eurodist)
labels(eurodist)
as.matrix(eurodist)[1:5, 1:5]

eurocity.mds <- cmdscale(d=eurodist)
head(eurocity.mds)

plot(eurocity.mds, type="n", main="Multidimensional Scaling Plot")
text(eurocity.mds, rownames(eurocity.mds), col="maroon", cex=0.7)

str(USJudgeRatings)
USJudgeRatings.dist <- dist(USJudgeRatings)
USJudgeRatings.mds <- cmdscale(USJudgeRatings.dist)

plot(USJudgeRatings.mds, type="n", main="Multidimensional Scaling Plot")
text(USJudgeRatings.mds, rownames(USJudgeRatings), col="blue", cex=0.6)

str(mtcars)
library(cluster)
mtcars.dist <- daisy(mtcars, metric="gower")
library(MASS)
mtcars.mds <- isoMDS(mtcars.dist)
str(mtcars.mds)

plot(mtcars.mds$points, type="n", main="Multidimensional Scaling Plot")
text(mtcars.mds$points, rownames(mtcars), col="purple", cex=0.7)

