# Unit 17. Hypothesis Test

height <- survey$Height
h.mean <- mean(height, na.rm = T)
h.mean
h.sd <- sd(height, na.rm = T)
h.sd
c(h.mean - 1.96*h.sd, h.mean + 1.96*h.sd)

qnorm(0.025, mean = h.mean, sd = h.sd)
qnorm(0.975, mean = h.mean, sd = h.sd)
pnorm(153.0801, mean = h.mean, sd = h.sd)
pnorm(191.6817, mean = h.mean, sd = h.sd, lower.tail = F)

x <- seq(h.mean-3*h.sd, h.mean+3*h.sd, length.out = 200)
y <- dnorm(x, h.mean, h.sd)

plot(x, y, type = 'l', col = "lightgrey", lwd = 2)
abline(0, 0, col = "lightgrey", lwd = 2)
xlim <- x[lower <= x & x <= upper]
ylim <- y[lower <= x & x <= upper] - 0.0001
xlim <- c(xlim[1], xlim, tail(xlim, 1))
ylim <- c(0, ylim, 0)
polygon(xlim, ylim, col = "lightgrey")

?binom.test

binom.test(x = 60, n = 100, p = 0.5)

set.seed(2022)
X <- rbinom(n = 10000, size = 100, prob = 0.5)
hist(X, col = "lightgray", breaks = 15, freq = F)
x <- seq(0, 100, 1)
curve(dnorm(x, mean(X), sd(X)), add = T, col = "tomato", lwd = 2)

qnorm(p=0.095, mean(X), sd(X), lower.tail = F)
pnorm(q=60, mean(X), sd(X), lower.tail = F)

binom.test(x = 65, n = 100, p = 0.5)

binom.test(35, 100, 0.5, conf.level = 0.99)

binom.test(60, 100, 0.5, alternative = "greater")
binom.test(45, 100, 0.5, alternative = "less")

binom.test(40, 100, 0.5, alternative = "two.sided")


?shapiro.test
shapiro.test(survey$Height)
shapiro.test(survey$Age)

set.seed(2022)
x.unif <- runif(100, min = 0, max = 100)
x.norm <- rnorm(100, mean(x.unif), sd(x.unif))
shapiro.test(x.unif)
shapiro.test(x.norm)

par(mfrow = c(1, 2))
qqnorm(x.unif, col = "tomato", main = "Uniform Distribution")
qqline(x.unif)
qqnorm(x.norm, col = "steelblue", main = "Normal Distribution")
qqline(x.norm)
par(mfrow = c(1, 1))
