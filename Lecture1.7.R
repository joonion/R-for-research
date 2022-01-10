# 7.1

head(iris)
str(iris)
summary(iris)

y <- subset(iris, Species=='setosa')$Petal.Length
y
mean(y)
sd(y)

n <- length(y)
ci_lower <- mean(y) - 2*sd(y) / sqrt(n)
ci_upper <- mean(y) + 2*sd(y) / sqrt(n)
c(ci_lower, ci_upper)

# 7.2

n_sim <- 10000
means <- c()
for (i in 1:n_sim) {
    bs_sample <- sample(y, length(y), replace=T)
    sample_mean <- mean(bs_sample)
    means <- c(means, sample_mean)
}

c(quantile(means, .025), quantile(means, .975))

c(mean(y) + qt(.025, df = n-1)*sd(y) / sqrt(n), 
  mean(y) + qt(.975, df=n-1)*sd(y) / sqrt(n))

# 7.3

n_sim <- 10000
sds <- c()
for (i in 1:n_sim) {
    bs_sample <- sample(y, length(y), replace=T)
    sample_sd <- sd(bs_sample)
    sds <- c(sds, sample_sd)
}

c(quantile(sds, .025), quantile(sds, .975))

sqrt(var(y)*(n-1) / qchisq(.975, n-1))
sqrt(var(y)*(n-1) / qchisq(.025, n-1))

# 7.4

x <- subset(iris, Species == 'virginica')$Petal.Length
y <- subset(iris, Species == 'versicolor')$Petal.Length

n_sim <- 10000
difs <- c()
for (i in 1:n_sim) {
    bs_virginica <- sample(x, length(x), replace=T)
    bs_setosa <- sample(y, length(y), replace=T)
    mean_dif <- mean(bs_virginica) - mean(bs_setosa)
    difs <- c(difs, mean_dif)
}

c(quantile(difs, .025), quantile(difs, .975))
c(quantile(difs, .005), quantile(difs, .995))
