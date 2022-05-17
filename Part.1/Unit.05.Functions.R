# Unit 5. Functions

add <- function (x, y) {
    z <- x + y
    return (z)
}
add
add(3, 4)

func1 <- function (x, y, z) {
    return (x + 2 * y + 3 * z)
}
func1(1, 2, 3)
func1(x = 1, y = 2, z = 3)
func1(3, 2, 1)
func1(z = 3, x = 2, y = 1)
func1(1, z = 2, y = 3)

func2 <- function (x, y=1, z=0) {
    return (x + 2 * y + 3 * z)
}

func2(1, 2, 3)
func2(1)
func2(1, 2)
func2(y = 2, z = 3)
func2(2, 3, x = 1)
func2(z = 1, x = 2)

pi <- 3.141592
round(pi, 2)
round(x = pi, digits = 4)
round(digits = 4, x = pi)
round(digits = 3)

head(iris)
head(x = iris, n = 3)
head(n = 3, iris)
head(3, iris)

sadd1 <- function(x, y) {
    return (x + y)
}
sadd1(3, 4)
sadd2 <- function(x, y) {
    x + y
}
sadd2(3, 4)
sadd3 <- function(x, y) x + y
sadd2(3, 4)

square <- function(x) x ^ 2
square(1:10)

vadd <- function(x, y) x + y
vadd(1:3, 3:1)

vmult <- function(x, y = 0) x * y
vmult(1:3)
vmult(1:3, 3:1)

div_count <- function(n) sum(n %% 1:n == 0)
prime_count <- function(n) sum(sapply(1:n, div_count) == 2)
div_count(25)
div_count(32)
prime_count(10)
prime_count(100)
