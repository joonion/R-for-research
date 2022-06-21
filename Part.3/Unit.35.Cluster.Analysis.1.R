# Unit 35. Cluster Analysis 1. Hierarchical Clustering

library(flexclust)
data(nutrient)
str(nutrient)
head(nutrient)

dist(nutrient)
d <- dist(nutrient)
class(d)
labels(d)
as.matrix(d)[1:5, 1:5]
as.matrix(dist(nutrient, method = "manhattan"))[1:5, 1:5]
?dist

library(cluster)
data(flower)
str(flower)
daisy(flower)
as.matrix(daisy(flower))
as.matrix(daisy(flower))[1:5, 1:5]

library(flexclust)

df <- nutrient
df.scaled <- scale(nutrient)
dist.nutrient <- dist(df.scaled)
hclust(dist.nutrient, method = "average")

clust <- hclust(dist.nutrient, method = "average")
plot(clust)
plot(clust, col = "steelblue")
plot(clust, col = "steelblue", hang = 1)
plot(clust, col = "steelblue", hang = 1, cex = 0.9)

library(NbClust)
NbClust(df.scaled, method = "average")
NbClust(df.scaled, method = "average", distance = "manhattan")
NbClust(df.scaled, method = "average", distance = "manhattan", min.nc = 3, max.nc = 15)

nc <- NbClust(df.scaled, method = "average", distance = "manhattan", min.nc = 3, max.nc = 15)
str(nc)
nc$Best.nc

clusters <- cutree(clust, k = 5)
clusters
table(clusters)
plot(clust, col = "steelblue", hang = 1, cex = 0.9)
rect.hclust(clust, k = 5)

par(mfrow = c(1, 1))
