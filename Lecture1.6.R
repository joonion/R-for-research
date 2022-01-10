# 6.1
?rnorm

set.seed(1234)
n_sim <- 10000
sample_size <- 100
means <- c()

for (i in 1:n_sim) {
    data <- rnorm(sample_size, 170, 15)
    means <- c(means, mean(data))
}

hist(means, xlab='X', ylab='N', prob=T, breaks=50)
curve(dnorm(x, 170, 15/sqrt(sample_size)), 
      from = 160, to = 180, add=T, lty=2, lwd=2, col='red')

mean(means)

# 6.2

se <- 15 / sqrt(sample_size)
means_within_2se <- (means > 170 - 2*se) & (means < 170 + 2*se)
sum(means_within_2se) / sample_size

se <- 15 / sqrt(sample_size)
means_within_2se <- (means > 170 - 2.58*se) & (means < 170 + 2.58*se)
sum(means_within_2se) / sample_size

se <- 15 / sqrt(sample_size)
means_within_2se <- (means > 170 - se) & (means < 170 + se)
sum(means_within_2se) / sample_size


# 6.3

set.seed(1235)
n_sim <- 10000
sample_size <- 100
m <- 170
s <- 15
se <- s / sqrt(sample_size)
X_bar_in_CI <- c()

for (i in 1:n_sim) {
    data <- rnorm(sample_size, m, s)
    X_bar <- mean(data)
    if ((X_bar - 2*se < m) & (m < X_bar + 2*se)) {
        X_bar_in_CI <- c(X_bar_in_CI, TRUE)
    } else {
        X_bar_in_CI <- c(X_bar_in_CI, FALSE)
    }
}

mean(X_bar_in_CI)


