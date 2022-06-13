# Unit 34. Dimension Reduction 2. Factor Analysis & MDS

library(ade4)
data(olympic)
str(olympic)

library(psych)
fa.parallel(olympic$tab, fm = "ml", fa = "fa", n.iter = 100)

library(nFactors)
nScree(olympic$tab)

eigen(cor(olympic$tab))
eigen(cor(olympic$tab))$values

factanal(olympic$tab, factors = 2, scores = "regression")

fa <- factanal(olympic$tab, factors = 2, scores = "regression")
fa$loadings
print(fa$loadings, cutoff = 0.001)

round(fa$uniquenesses, 3)
round(1 - fa$uniquenesses, 3)

factor.plot(fa, labels = colnames(olympic$tab), pch = 20, pos = 4)

library(semPlot)
semPaths(fa, what = "est", residuals = F, cut = 0.3, title = T,
         posCol = c("white", "darkgreen"), negCol = c("white", "red"))

fa$scores
fa.scores <- fa$scores
colnames(fa.scores) <- c("Run", "Throw")

library(gplots)
library(RColorBrewer)
heatmap.2(fa.scores, col = brewer.pal(9, "GnBu"), trace = "none", key = F,
          dend = "none", cexCol = 1.2)
