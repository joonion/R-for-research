# Unit 19. t-distribution and t-test (2)

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

# Two-independent-samples & paired-samples t-test

t.test(formula = Height ~ Sex, data = survey)

library(MASS)
?cats
str(cats)

?stargazer
library(stargazer)
stargazer(cats, type = "text")

?tapply
with(cats, tapply(Bwt, INDEX=list(Sex), FUN = mean))
with(cats, tapply(Hwt, INDEX=list(Sex), FUN = mean))

?t.test
t.test(formula = Bwt ~ Sex, data = cats)
t.test(formula = Hwt ~ Sex, data = cats)


?sleep
str(sleep)
sleep

library(tidyr)
spread(sleep, key = group, value = extra)

t.test(extra ~ group, data = sleep, paired = TRUE)

sleep.wide <- spread(sleep, key = group, value = extra)
names(sleep.wide) <- c("ID", "group.1", "group.2")

t.test(sleep.wide$group.1, sleep.wide$group.2, paired = T)

?split
split(sleep, f = group)

