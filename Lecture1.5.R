# 5.1

lotto <- function (x) {
    return (choose(39, 6-x) * choose(6, x))
}

for (x in 0:6) {
    cat(x, lotto(x), '\n')
}

# 5.2

lotto2 <- function (x) {
    return (lotto(x) / choose(45, 6))
}

for (x in 0:6) {
    cat(x, lotto2(x), '\n')
}

print(1 / choose(45, 6))

# 5.3

win <- 0:6
win
prob <- sapply(win, lotto2)
prob
barplot(prob, names=df$win,
        col = c("red", "blue", "grey"))

# 5.4

pnorm(35000, 30000, 10000) - pnorm(25000, 30000, 10000)
curve(dnorm(x), -3, 3, xlab = 'X', ylab = 'density')

# 5.5

n_sim <- 10000
y <- rbinom(n_sim, 100, 0.5)
hist(y, xlab='X', ylab='mass', 
     main = 'Binom(100, 0.5)', 
     col = c('grey'),
     prob = T, 
     breaks = 30)
curve(dnorm(x, 50, 5), 25, 75, 
      add=T, 
      lty=2, lwd=2, col='red')

# 5.6

n_sim <- 1000
n <- 30
means <- vector(length = n_sim)

for (i in 1:n_sim) {
    y <- vector(length = n)
    for (j in 1:30) {
        gender <- rbinom(1, 1, 0.5)
        if (gender == 0) {
            y[j] <- rnorm(1, 160, 5)
        } else {
            y[j] <- rnorm(1, 175, 5)
        }
    }
    means[i] <- mean(y)
}

hist(means, 
     main = 'Distribution of means', 
     xlab = 'mean_height',
     ylab = 'prob',
     prob = T)
