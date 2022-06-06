# Unit 21. ANOVA (1): F-distribution and F-test

adhd <- data.frame(score=c(95,105,98,103,107,110,125,105,113,120),
                     therapy=c(rep("A", 5), rep("B", 5)))
adhd

g <- 2
ng <- c(5, 5)
mg <- c(mean(adhd$score[1:5]), mean(adhd$score[6:10]))
m <- mean(adhd$score)
mstr <- sum(((mg-m)^2*ng) / (g-1))
mstr

Xg1 <- adhd$score[1:5]
Xg2 <- adhd$score[6:10]
mse <- (sum((Xg1-mg[1])^2) + sum((Xg2-mg[2])^2)) / sum(ng - 1)
mse

F.value <- mstr/mse
F.value

x <- seq(0, 4, length=100)
F.1 <- df(x, df1=1, df2=30)
F.5 <- df(x, df1=5, df2=25)
F.25 <- df(x, df1=25, df2=5)
plot(x, F.1, lty=1, lwd=3, col="black", type="l", ylim=c(0, 1))
lines(x, F.5, lty=2,lwd=3, col="blue")
lines(x, F.25, lty=3, lwd=3, col="red")
legend('topright', lty=c(1, 2, 3), col=c("black", "blue", "red"), 
       legend=c("df = 1, 30", "df = 5, 25", "df = 25, 5"))

pf(9.59, df1=1, df=8, lower.tail=FALSE)
qf(0.05, df1=1, df=8, lower.tail=FALSE)

x <- seq(0, 6.5, length=200)
y <- df(x, df1=4, df2=4)
plot(x, y, type='l',
     main="F distribution (df1=4, df2=4)")

xlim <- x[5.32<=x]
ylim <- y[5.32<=x]
xlim <- c(xlim[1], xlim, tail(xlim, 1))
ylim <- c(0, ylim, 0) 
polygon(xlim, ylim, col="grey")

str(adhd)
adhd.aov <- aov(score ~ therapy, data=adhd)
summary(adhd.aov)


