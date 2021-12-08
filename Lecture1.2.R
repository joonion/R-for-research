# 2.1
x <- 6
A <- x * x
A

# 2.2
v <- 10:15
v
v[1]
v[6]
length(v)
sum(v)
mean(v)

v <- c(10, 20, 40, 70, 90)
v
v[1]
v[length(v)]
var(v)
sd(v)

# 2.3
v <- c(1)
for (i in 2:10) {
    v[i] <- v[i - 1] + 4 * (i - 1)
}
print(v)
print(sum(v))

# 2.4
n <- 10
factorial <- 1
for (i in 1:n) {
    factorial <- factorial * i
}
factorial

# 2.5
fact <- function (n) {
    factorial <- 1
    for (i in 1:n) {
        factorial <- factorial * i
    }
    return (factorial)
}

fact(10)

# 2.6
fact2 <- function (n) {
    if (n == 1)
        return (1)
    else
        return (5 * fact(n - 1))
}

fact2(10)


n <- 10
s <- n
s <- s - n*(n+1)
s <- s + n*(n+1)*(2*n+1) / 3
s



