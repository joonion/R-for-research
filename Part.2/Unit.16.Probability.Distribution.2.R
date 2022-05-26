# Unit 16. Probability Distribution (2)

# uniform distribution
?runif

runif(n = 100, min = 0, max = 100)

hist(runif(100,   0, 100), col = "orange")
hist(runif(1000,  0, 100), col = "salmon")
hist(runif(10000, 0, 100), col = "tomato")

set.seed(2022)
hist(runif(100, 0, 100), col = "steelblue")

# binomial distribution
?binom

set.seed(2022)
rbinom(n = 1, size = 1, prob = 0.5)
rbinom(n = 1, size = 10, prob = 0.5)
rbinom(n = 10, size = 10, prob = 0.5)
rbinom(n = 100, size = 10, prob = 0.5)

set.seed(2022)
X <- rbinom(n = 10000, size = 100, prob = 0.5)
hist(X, col = "skyblue", breaks = 15)

# normal distribution
?rnorm

set.seed(2022)
X <- rnorm(n = 1000, mean = 172, sd = 10)
hist(X, col = "skyblue", breaks = 30)

hist(X, col = "skyblue", breaks = 30, freq = F)
x <- seq(min(X), max(X), length.out = 200)
curve(dnorm(x, 172, 10), add = T, col = "tomato", lwd = 2)

?curve
?pnorm
pnorm(q = 160, mean = 172, sd = 10)
pnorm(q = 160, mean = 172, sd = 10, lower.tail = F)

pnorm(q = 180, mean = 172, sd = 10, lower.tail = F)
pnorm(q = 180, mean = 172, sd = 10)

1 - pnorm(160, 172, 10) - pnorm(180, 172, 10, lower.tail = F)
1 - pnorm(162, 172, 10) - pnorm(182, 172, 10, lower.tail = F)
1 - pnorm(152, 172, 10) - pnorm(192, 172, 10, lower.tail = F)

qnorm(p = 0.05, mean = 172, sd = 10)
qnorm(p = 0.95, mean = 172, sd = 10)
qnorm(c(0.05, 0.95), 172, 10)
qnorm(c(0.025, 0.975), 172, 10)
qnorm(c(0.005, 0.995), 172, 10)

x <- seq(from = -3, to = 3, length.out = 200)
plot(x, dnorm(x), type = "l", col = "tomato", lwd = 2)

qnorm(c(0.025, 0.975), 0, 1)
pnorm(c(-1.96, 1.96), 0, 1)

qnorm(c(0.005, 0.995), 0, 1)
pnorm(c(-2.58, 2.58), 0, 1)

1 - pnorm(-1) - pnorm(1, lower.tail = F)
1 - pnorm(-1.96) - pnorm(1.96, lower.tail = F)
1 - pnorm(-2.58) - pnorm(2, lower.tail = F)

x <- seq(from = -3, to = 3, length.out = 200)
plot(x, dnorm(x), type = "l", col = "gray", lwd = 2)

x <- 1:9
sample(x, size = 7)
sample(x, size = 10)
sample(x, size = 10, replace = T)

# central limit theorem

X.norm <- rnorm(n = 10000, mean = 50, sd = 25)
mean(X.norm)
sd(X.norm)
hist(X.norm, col = "orange", freq = F, ylim = c(0, 0.02))

X.bar <- c()
for (i in 1:10000) {
    X.bar <- c(X.bar, mean(sample(X.norm, size = 100)))
}
hist(X.bar, col = "skyblue", freq = F)

X.unif <- runif(n = 10000, min = 0, max = 100)
hist(X.unif, col = "tomato", freq = F, ylim = c(0, 0.02))
mean(X.unif)
sd(X.unif)

X.bar <- c()
for (i in 1:10000) {
    X.bar <- c(X.bar, mean(sample(X.unif, size = 100)))
}
hist(X.bar, col = "cyan3", freq = F)
