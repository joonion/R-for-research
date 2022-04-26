# Unit 14. t-test

windows(width = 7, height = 5)

?t.test

library(MASS)
t.test(survey$Height, mu = 175)
t.test(survey$Height, mu = 172)
t.test(survey$Height, mu = 171, conf.level = 0.99)

t.test(survey$Height, mu = 173, alternative = "greater")
t.test(survey$Height, mu = 174, alternative = "less")

t.height <- t.test(survey$Height, mu = 172)
str(t.height)
t.height$statistic
t.height$p.value
t.height$conf.int

x <- seq(-3, 3, length = 200)
curve(dt(x, df=30), min(x), max(x), lty = 1, lwd=3, col="darkblue",
      main = "PDF of t-distribution", xlab = "t", ylab = "density")
curve(dt(x, df=5),  min(x), max(x), lty = 2, lwd=3, col="violet", add = T)
curve(dt(x, df=1),  min(x), max(x), lty = 3, lwd=3, col="tomato", add = T)
legend("topright", legend = c("df=30", "df=5", "df=1"), 
       col=c("darkblue", "violet", "tomato"), lty=c(1, 2, 3))

y <- dt(x, df=1)
abline(0, 0)
xlim <- x[lower <= x & x <= upper]
ylim <- y[lower <= x & x <= upper] - 0.0001
xlim <- c(xlim[1], xlim, tail(xlim, 1))
ylim <- c(0, ylim, 0)
polygon(xlim, ylim, col = "lightgrey")


