# Unit 31. Generalized Linear Model 1.

x <- 0:100
pdf <- dpois(x, lambda=10)
plot(x, pdf, type='l', main="Poisson Distribution, lambda=10")

library(robust)
data("breslow.dat")
str(breslow.dat)

seizure <- breslow.dat[c("Base", "Age", "Trt", "sumY")]
summary(seizure)

hist(seizure$sumY, breaks = 20, col = "cornflowerblue",
     xlab = "Seizure Count", main = "Distribution of Seizures")

seizure.poisson <- glm(sumY ~ Base + Age + Trt, data = seizure, family = poisson)
summary(seizure.poisson)

coef(seizure.poisson)
exp(coef(seizure.poisson))

e <- exp(1)
z <- seq(-6, 6, length=200)
p <- 1 / (1 + e^(-z))
plot(z, p, type="l", main="PDF of Logistic Function")

library(modeldata)
data(mlc_churn)
str(mlc_churn)

churn <- mlc_churn[, -c(1, 3)]
levels(churn$churn)

churn$churn <- factor(ifelse(churn$churn=="no", 1, 2),
                      levels=c(1, 2), labels=c("no", "yes"))
str(churn)
levels(churn$churn)
churn$churn

nrow(churn)
churn.train <- churn[1:3333,]
churn.test <- churn[3334:5000,]

table(churn.train$churn)
prop.table(table(churn.train$churn))
table(churn.test$churn)
prop.table(table(churn.test$churn))

churn.logit <- glm(churn ~ ., data=churn.train, family=binomial(link="logit"))
summary(churn.logit)

coef(churn.logit)
exp(coef(churn.logit))
