# Unit.14 Probability and Statistics

?rbinom

x <- rbinom(n = 10, size = 1, prob = 0.5)
x
sum(x) / 10
mean(x)

x <- rbinom(100, 1, 0.5)
mean(x)

x <- rbinom(10000, 1, 0.5)
mean(x)

?sample

sample(x = 1:10, size = 10, replace = T)
sample(x = 1:10, size = 10, replace = F)

# Calculating Pi by Monte-Carlo Simulation

n_sim <- 1000
x <- vector(length = n_sim)
y <- vector(length = n_sim)
res = 0
for (i in 1:n_sim) {
    x[i] <- runif(1)
    y[i] <- runif(1)
    if (x[i]^2 + y[i]^2 < 1) {
        res <- res + 1
    }
}
4 * res / n_sim

circle <- function (x) sqrt(1 - x^2)
plot(x, y, xlab='X', ylab='Y', col='blue')
curve(circle, from = 0, to = 1, add=T, col='red', lwd=2)

# Dice Simulation

n_sim <- 10000
n_odd <- 0
n_five <- 0
for (i in 1:n_sim) {
    trial = sample(1:6, 1)
    if (trial %% 2 == 1) n_odd <- n_odd + 1
    if (trial == 5) n_five <- n_five + 1
}
n_five / n_odd
p_odd <- n_odd / n_sim
p_five <- n_five / n_sim
p_five / p_odd

n_sim <- 10000         # 검사 횟수
prevalence <- 0.001    # 유병율

sensitivity <- 0.99    # 검사의 민감도
specificity <- 0.99    # 검사의 특이도

n_total_positive <- 0  # 전체 질환 케이스 수
n_true_positive <- 0   # 실제 환자 수
n_false_positive <- 0  # 오진 케이스 수

for (i in 1:n_sim) {
    # 유병율에 따라 실제 병의 유무를 할당함
    disease <- rbinom(1, 1, prevalence)
    if (disease == 0) { # 실제 병이 없는 경우
        diagnosis <- rbinom(1, 1, 1-specificity)
        if (diagnosis == 1) {
            n_total_positive <- n_total_positive + 1
            n_false_positive <- n_false_positive + 1
        }
    }
    if (disease == 1) { # 실제 병이 있는 경우
        diagnosis <- rbinom(1, 1, sensitivity)
        if (diagnosis == 1) {
            n_total_positive <- n_total_positive + 1
            n_true_positive <- n_false_positive + 1
        }
    }
}

n_total_positive # 양성의 수
n_true_positive  # 진양성의 수
n_false_positive # 위양성의 수
n_false_positive / n_total_positive


