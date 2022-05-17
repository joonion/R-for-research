# Unit 3. R Basics

x <- 10
x

20 -> y
y

z = x + y
z

# 1.val <- 200

var.1 <- 100
Var.1

class(TRUE)
class(3)
class("Hello")

var <- TRUE
class(var)

var <- 3
class(var)

var <- "Hello"
class(var)

x <- 2
y <- 2 * ((x+2)-(x+4)) / 2 + 3
y

7 %/% 3
7 %% 3

10 ^ 2
2 ** 10

3 < 4
5 > 7
x <- 5
y <- x
x == y
x != y

!TRUE & TRUE | FALSE
x <- 3
(x > 3) && (x < 4)

score <- 91

if (score >= 90) {
    grade <- "A"
} else if (score >= 80) {
    grade <- "B"
} else {
    grade <- "C"
}
grade

s <- 0
i <- 1
while (i <= 10) {
    s <- s + i
    i <- i + 1
}
s

s <- 0
for (i in 1:10) {
    s <- s + i
}
s

n <- 32
count <- 0
for (i in 1:n) {
    if (n %% i == 0) {
        cat(i, " ")
        count <- count + 1
    }
}
count

n <- 17
is.prime = TRUE
for (i in 2:(n-1)) {
    if (n %% i == 0) {
        is.prime <- FALSE
        break
    }
}
is.prime

for (i in 1:3) {
    cat(i, ": ")
    for (j in 1:5) {
        cat(j, " ")
    }
    cat("\n")
}

# exercise 3.1

x <- 5
area <- x * x
area

pi <- 3.141592
r <- 5
round <- 2 * pi * r
round
area <- pi * r * r
area

# exercise 3.2

n <- 15
if (n %% 3 == 0 && n %% 5 == 0) {
    order <- "피자나라치킨공주"
} else if (n %% 3 == 0) {
    order <- "피자"
} else if (n %% 5 == 0) {
    order <- "치킨"
} else {
    order <- "다이어트"
}
order

# exercise 3.3

n <- 10
S <- 0
for (i in 1:n) {
    S <- S + (i ^ 3)
}
S

n <- 10
S <- 1
for (i in 1:n) {
    S <- S * i
}
S

# exercise 3.4

n <- 15
pizza <- 0
chicken <- 0
combo <- 0
diet <- 0
for (i in 1:n) {
    if (i %% 3 == 0 && i %% 5 == 0) {
        combo <- combo + 1
        cat(i, "피자나라치킨공주", '\n')
    } else if (i %% 3 == 0) {
        pizza <- pizza + 1
        cat(i, "피자", '\n')
    } else if (i %% 5 == 0) {
        chicken <- chicken + 1
        cat(i, "치킨", '\n')
    } else {
        diet <- diet + 1
        cat(i, "다이어트트", '\n')
    }
}
cat("pizza =", pizza, "\n")
cat("chicken =", chicken, "\n")
cat("combo =", combo, "\n")
cat("diet =", diet, "\n")

# exercise 3.5

n <- 5
for (i in 1:n) {
    for (j in 1:n) {
        cat('*')
    }
    cat('\n')
}
    
n <- 5
for (i in 1:n) {
    for (j in 1:i) {
        cat('*')
    }
    cat('\n')
}

n <- 5
for (i in 1:n) {
    if (i %% 2 == 0) {
        cat('*')
    } else {
        for (j in 1:n) {
            cat('*')
        }
    }
    cat('\n')
}

# exercise 3.6

n <- 10
count <- 0
for (i in 2:n) {
    is.prime = TRUE
    if (i > 2) {
        for (j in 2:(i-1)) {
            if (i %% j == 0) {
                is.prime = FALSE
                break
            }
        }
    }
    if (is.prime) {
        count <- count + 1
        cat(i, ' ')
    }
}
count

# exercise 3.7

n <- 10
maxval <- 0
maxcount <- 0
for (i in 1:n) {
    count <- 0
    for (j in 1:i) {
        if (i %% j == 0) {
            count <- count + 1
        }
    }
    if (count >= maxcount) {
        maxcount <- count
        maxval <- i
    }
    cat(i, ": ", count, '\n')
}
maxval

