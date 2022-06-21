# Unit 36. Cluster Analysis 2. k-means Clustering

str(state.x77)
head(state.x77)
mat <- scale(state.x77)
round(head(mat), 2)

library(NbClust)
nb <- NbClust(mat, method = "kmeans")
par(mfrow = c(1, 1))
table(nb$Best.nc[1, ])

clustered <- kmeans(mat, centers = 3)
str(clustered)
clustered$size
clustered$cluster
clustered$centers

aggregate(state.x77, by = list(cluster=clustered$cluster), mean)

library(cluster)
clusplot(state.x77, clus = clustered$cluster)
clusplot(state.x77, clus = clustered$cluster, color = T, shade = T)
clusplot(state.x77, clus = clustered$cluster, color = T, shade = T, labels = 2)
clusplot(state.x77, clus = clustered$cluster, color = T, shade = T, labels = 2, lines = 0)


library(rattle)
str(wine)
head(wine)

library(cluster)
pam.clust <- pam(wine[, -1], k = 3, stand = T)
str(pam.clust)
pam.clust$clusinfo
pam.clust$medoids
pam.clust$id.med
pam.clust$clustering

aggregate(wine[, -1], by = list(cluster=pam.clust$clustering), mean)

clusplot(pam.clust, color = T, shade = T, labels = 2, lines = 0)

table(wine$Type, pam.clust$clustering)
table(wine$Type, pam.clust$clustering, dnn = c("Actual", "Clustered"))

mean(wine$Type == pam.clust$clustering)

library(flexclust)          
pam.result <- table(wine$Type, pam.clust$clustering, dnn = c("Actual", "Clustered"))
randIndex(pam.result)

# Time-series

plot(co2, lwd=2, col="tomato",
     main="Time Series Plot of CO2 Concentration")

data(co2)
str(co2)
class(co2)
head(co2)
head(co2, 3*12)

plot(co2, lwd=2, col="tomato")

start(co2)
end(co2)

frequency(co2)
time(co2)
cycle(co2)

window(co2, start = c(1990, 1), end=c(1995, 12))
window(co2, start = c(1990, 1), frequency = 1)
window(co2, start=c(1990, 1), frequency = 2)
window(co2, start=c(1990, 1), frequency = 4)
