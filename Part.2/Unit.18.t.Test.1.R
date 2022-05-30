# Unit 18. t-distribution and t-test (1)

x <- seq(-3, 3, length = 200)
curve(dt(x, df=30), min(x), max(x), lty = 1, lwd=3, col="darkblue",
      main = "PDF of t-distribution", xlab = "t", ylab = "density")
curve(dt(x, df=5), min(x), max(x), lty = 2, lwd=3, col="violet", add = T)
curve(dt(x, df=1), min(x), max(x), lty = 3, lwd=3, col="tomato", add = T)
legend("topright", legend = c("df=30", "df=5", "df=1"), 
       col=c("darkblue", "violet", "tomato"), lty=c(1, 2, 3))

t <- (135-115)/(25/sqrt(20))
t
pt(3.58, df=19, lower.tail=FALSE)*2
qt(0.025, df=19, lower.tail=FALSE)
qt(0.005, df=19, lower.tail=FALSE)

x <- seq(-4, 4, length=300)
y <- dt(x, df=19)
plot(x, y, type='l',
     main="t-distribution (df=19)")

xlim <- x[-4<=x & x<=-2.09]
ylim <- y[-4<=x & x<=-2.09]
xlim <- c(xlim[1], xlim, tail(xlim, 1))
ylim <- c(0, ylim, 0) 
polygon(xlim, ylim, col="grey")

xlim <- x[2.09<=x & x<=4]
ylim <- y[2.09<=x & x<=4]
xlim <- c(xlim[1], xlim, tail(xlim, 1))
ylim <- c(0, ylim, 0) 
polygon(xlim, ylim, col="grey")

?t.test

str(cats)

t.test(x=cats$Bwt, mu=2.6)
t.test(x=cats$Bwt, mu=2.7)

t.test(cats$Bwt, mu=2.6, alternative="greater")

cats.t <- t.test(cats$Bwt, mu=2.6)
str(cats.t)
cats.t$p.value
cats.t$conf.int

t.test(cats$Bwt, mu=2.6, conf.level=0.99)



