# Unit 4. Vectors

v1 <- vector(length=2)
v1
v2 <- 1:10
v2
v3 <- c(1, 2, 3, 5, 7)
v3
v4 <- seq(from=1, to=10, by=2)
v4
v5 <- rep(1:3, each=2, times=2)
v5

v1 <- c(1, 2, 3:5)
v1
v2 <- c(5:6, seq(7, 9, 2))
v2
v3 <- c(v1, v2)    
v3    

v1 <- c(T, T, F, F, T)
v1
v2 <- c(T, F, 3, 3.14)
v2
v3 <- c(3, 3.14, "PI=3.14")
v3
v4 <- c(T, F, 3, "3.14")
v4

v <- c(10, 20, 30, 40, 50, 60, 70)
v[1]
v[7]
v[1:3]
v[c(1, 3, 5, 7)]
v[c(T, T, F, F, F, F, T)]

v <- c(10, 20, 30, 40, 50, 60, 70)
v < 30
v[v < 30]
v < 30 | v > 50
v[v < 30 | v > 50]
v %% 3 == 0 & v %% 4 == 0
v[v %% 3 == 0 & v %% 4 == 0]

v <- c(10, 20, 30, 40, 50, 60, 70)
v[-1]
v[-(1:3)]
v[-c(1, 3, 5, 7)]
v[!(v %% 20 == 0)]

v <- c(10, 20, 30, 40, 50, 60, 70)
v[1] <- 11
v
v[2:3] <- c(22, 33)
v
v[v >= 50] <- v[v < 30]
v
v[8] <- 80
v

v <- c()
for (i in 1:15) {
    if (i %% 3 == 0 && i %% 5 == 0) {
        v <- c(v, 'PZ')
    } else if (i %% 3 == 0) {
        v <- c(v, 'P')
    } else if (i %% 5 == 0) {
        v <- c(v, 'C')
    } else {
        v <- c(v, 'D')
    }
}
v
which(v == 'P')
which(v == 'C')
which(v == 'PC')

v1 <- c(1, 2, 3, 4, 5)
v2 <- c(1, 2)
v3 <- v1 + v2
v3
v4 <- 2 * v1
v4
v5 <- v1 * v2
v5

v1 <- c(T, T, F, F, T)
sum(v1)
v2 <- v1 + 2
v2
v3 <- 1:5 + c(T, F)
v3
sum(1:5 > c(2, 4))

sex <- c('M', 'F', 'M', 'F', 'F')
sex
f.sex <- factor(sex)
f.sex
str(f.sex)
levels(f.sex)
table(f.sex)

blood <- c(1, 2, 3, 1, 4, 3, 2, 4)
blood
f.blood <- factor(blood, 
                  levels = c(1, 2, 3, 4), 
                  labels = c('A', 'B', 'AB', 'O'))
f.blood
levels(f.blood)
table(f.blood)

v1 <- 1:7
v2 <- c('홍길동', '전우치', '주니온', '아사달', '아사녀', '연오랑', '세오녀')
v3 <- factor(c('M', 'M', 'M', 'M', 'F', 'M', 'F'))
lst <- list(no = v1, name = v2, sex = v3)
str(lst)
lst

names(lst)
lst$no
sum(lst$no)
lst$name
lst$name[1:3]
lst$sex
table(lst$sex)

m <- matrix(1:12, nrow = 3, ncol = 4)
m
m <- t(m)
m
dim(m)
nrow(m)
ncol(m)

m[2, 3]
m[3, 2]
m[2:3, 1:2]
m[1:2, ]
m[, 1:2]

rbind(m[1, ], m[4, ])
cbind(m[, 1], m[, 3])

# exercise 4.1

height <- c(163, 175, 182, 178, 161)
weight <- c(65, 87, 74, 63, 51)
blood <- factor(c('A', 'B', 'AB', 'O', 'A'))
lst <- list(height = height, weight = weight, blood = blood)
lst
mean(lst$height)
mean(lst$weight)
table(lst$blood)

# exercise 4.2

div <- c()
for (i in 1:15) {
    count <- 0
    for (j in 1:i) {
        if (i %% j == 0) {
            count <- count + 1
        }
    }
    div <- c(div, count)
}
div

sum(div == 2)
length(div[div == 2])

which(div == 2)

