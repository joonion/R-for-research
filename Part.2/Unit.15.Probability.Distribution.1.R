# Unit 15. Probability Distribution (1)

x <- seq(-3, 3, length=200)
plot(x, dnorm(x, mean=0, sd=1), type='l', main="Normal Distribution")

x <- seq(0, 100, length=200)
plot(x, dnorm(x, mean=50, sd=10), type = 'l', main="Normal Distribution(m=50, s=10)")

x <- seq(0, 100, length=200)
plot(x, dnorm(x, mean=50, sd=20), type = 'l', main="Normal Distribution(m=50, s=20")

pnorm(35000, 30000, 10000) - pnorm(25000, 30000, 10000)

x <- seq(10000, 50000, length=200)
y <- dnorm(x, mean = 30000, sd = 10000)
plot(x, y, type='l',
     main="$25000 ~ $35000 사이에 있을 확률")
xlim <- x[25000<=x & x<=35000]
ylim <- y[25000<=x & x<=35000]
xlim <- c(xlim[1], xlim, tail(xlim, 1))
ylim <- c(0, ylim, 0) 
polygon(xlim, ylim, col="grey")

# exercise 15.1

x <- seq(10000, 50000, length=200)
y <- dnorm(x, mean = 30000, sd = 10000)
plot(x, y, type='l',
     main="$25000 ~ $35000 사이에 있을 확률")

xlim <- x[10000<=x & x<=25000]
ylim <- y[10000<=x & x<=25000]
xlim <- c(xlim[1], xlim, tail(xlim, 1))
ylim <- c(0, ylim, 0) 
polygon(xlim, ylim, col="grey")

x <- seq(10000, 50000, length=200)
y <- dnorm(x, mean = 30000, sd = 10000)
plot(x, y, type='l',
     main="$25000 ~ $35000 사이에 있을 확률")

xlim <- x[35000<=x & x<=50000]
ylim <- y[35000<=x & x<=50000]
xlim <- c(xlim[1], xlim, tail(xlim, 1))
ylim <- c(0, ylim, 0) 
polygon(xlim, ylim, col="grey")

# end of exercise 15.1

1 - pnorm(70, 60, 10)
1 - pnorm(80, 70, 20)
z1 <- (70 - 60) / 10
z2 <- (80 - 70) / 20
z1
z2
1 - pnorm(z1)
1 - pnorm(z2)

curve(dnorm(x), -3, 3, 
      xlab = 'X', ylab = 'Y',
      main="Probability Density Function")

curve(pnorm(x), -3, 3, 
      xlab = 'X', ylab = 'Y',
      main="Cumulative Distribution Function")

n_sim <- 10000
y <- rbinom(n_sim, 100, 0.5)

hist(y, xlab='X', ylab='mass', 
     main = 'B(100, 0.5)', 
     prob = T, 
     breaks = 30)

curve(dnorm(x, 50, 5), 25, 75, 
      lty=2, lwd=2, col='red',
      add=T)


