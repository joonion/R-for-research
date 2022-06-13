# Unit 32. Generalized Linear Model 2. Logistic Regression Analysis

library(modeldata)
data(mlc_churn)
churn <- mlc_churn[, -c(1, 3)]
churn$churn <- factor(ifelse(churn$churn=="no", 1, 2),
                      levels=c(1, 2), labels=c("no", "yes"))
churn.train <- churn[1:3333,]
churn.test <- churn[3334:5000,]
churn.logit <- glm(churn ~ ., data=churn.train, family=binomial(link="logit"))

str(churn)

churn.test$international_plan <- ifelse(churn.test$international_plan=="no", 0, 1)
churn.test$voice_mail_plan <- ifelse(churn.test$voice_mail_plan=="no", 0, 1)
z <- coef(churn.logit)[1] + 
    (as.matrix(churn.test[-18]) %*% coef(churn.logit)[-1])
p <- 1/(1+exp(-z))
head(p)

churn.test <- churn[3334:5000,]
churn.logit.pred <- predict(churn.logit, newdata=churn.test, type="response")
head(churn.logit.pred)

churn.logit.pred <- factor(churn.logit.pred > 0.5, 
                           levels=c(FALSE, TRUE), labels=c("no", "yes"))
head(churn.logit.pred)
table(churn.logit.pred)

table(churn.test$churn, churn.logit.pred, dnn=c("Actual", "Predicted"))
mean(churn.test$churn==churn.logit.pred)

library(EffectStars)
data(PID)
str(PID)
head(PID)

library(VGAM)
pid.mlogit <- vglm(PID ~ ., family=multinomial(), data=PID)
summary(pid.mlogit)

exp(coef(pid.mlogit))

testdata <- data.frame(Education=c("low", "high"),
                       TVnews=mean(PID$TVnews),
                       Income=mean(PID$Income),
                       Age=mean(PID$Age),
                       Population=mean(PID$Population))
testdata

pid.mlogit.pred <- predict(pid.mlogit, newdata=testdata, type="response")
cbind(testdata, pid.mlogit.pred)

testdata <- data.frame(Education=rep("low", 5),
                       TVnews=mean(PID$TVnews),
                       Income=seq(20, 100, 20),
                       Age=mean(PID$Age),
                       Population=mean(PID$Population))
testdata

pid.mlogit.pred <- predict(pid.mlogit, newdata=testdata, type="response")
cbind(testdata, pid.mlogit.pred)
