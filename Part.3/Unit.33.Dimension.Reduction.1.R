# Unit 29. Dimension Reduction 1. Principal Component Analysis

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

biplot(pca, cex = c(0.5, 0.75))
?biplot
