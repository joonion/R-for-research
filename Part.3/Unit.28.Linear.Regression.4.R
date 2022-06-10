# Unit 28. Linear Regression 4. Penalized Regression

library(MASS)
str(Boston)

library(caret)
set.seed(123)
train <- createDataPartition(y=Boston$medv, p=0.7, list=FALSE)
Boston.train <- Boston[train,]
Boston.test <- Boston[-train,]

x <- model.matrix(medv ~ ., Boston.train)[,-1]
y <- Boston.train$medv

library(glmnet)
glmnet(x, y, alpha=1, lambda=NULL)

## Ridge

set.seed(123)
Boston.cv <- cv.glmnet(x=x, y=y, family="gaussian", alpha=0)

plot(Boston.cv)

Boston.cv$lambda.min
log(Boston.cv$lambda.min)

Boston.gnet <- glmnet(x, y, family="gaussian", alpha=0, lambda=Boston.cv$lambda.min)
coef(Boston.gnet)

Boston.test.x <- model.matrix(medv ~ ., Boston.test)[,-1]
Boston.pred <- predict(Boston.gnet, newx=Boston.test.x)
postResample(pred=Boston.pred, obs=Boston.test$medv)

## Lasso

set.seed(123)
Boston.cv <- cv.glmnet(x=x, y=y, family="gaussian", alpha=1)

plot(Boston.cv)

Boston.cv$lambda.min
log(Boston.cv$lambda.min)

Boston.cv$lambda.1se
log(Boston.cv$lambda.1se)

coef(Boston.cv, Boston.cv$lambda.min)

coef(Boston.cv, Boston.cv$lambda.1se)

Boston.gnet1 <- glmnet(x, y, family="gaussian", 
                       alpha=1, lambda=Boston.cv$lambda.min)
Boston.pred1 <- predict(Boston.gnet1, newx=Boston.test.x)
postResample(pred=Boston.pred1, obs=Boston.test$medv)

Boston.gnet2 <- glmnet(x, y, family="gaussian", 
                       alpha=1, lambda=Boston.cv$lambda.1se)
Boston.pred2 <- predict(Boston.gnet2, newx=Boston.test.x)
postResample(pred=Boston.pred2, obs=Boston.test$medv)

## Elastic net

library(caret)
set.seed(123)
Boston.cv <- train(form=medv ~ ., data=Boston.train, method="glmnet",
                   trControl=trainControl(method="cv", number=10),
                   tuneLength=10)

Boston.cv$bestTune

Boston.gnet <- glmnet(x, y, family="gaussian", 
                      alpha=Boston.cv$bestTune$alpha, 
                      lambda=Boston.cv$bestTune$lambda)
coef(Boston.gnet)

Boston.pred <- predict(Boston.gnet, newx=Boston.test.x)
postResample(pred=Boston.pred, obs=Boston.test$medv)

## Comparing different models

library(caret)
lambda <- 10^seq(-5, 5, length=100)
lambda

set.seed(123)
ridge <- train(medv ~ ., data=Boston.train, method="glmnet",
               trControl=trainControl(method="cv", number=10),
               tuneGrid=expand.grid(alpha=0, lambda=lambda))
coef(ridge$finalModel, ridge$bestTune$lambda)
ridge.pred <- predict(ridge, Boston.test)
postResample(pred=ridge.pred, obs=Boston.test$medv)

set.seed(123)
lasso <- train(medv ~ ., data=Boston.train, method="glmnet",
               trControl=trainControl(method="cv", number=10),
               tuneGrid=expand.grid(alpha=1, lambda=lambda))
coef(lasso$finalModel, lasso$bestTune$lambda)
lasso.pred <- predict(lasso, Boston.test)
postResample(pred=lasso.pred, obs=Boston.test$medv)

set.seed(123)
elastic <- train(form=medv ~ ., data=Boston.train, method="glmnet",
                 trControl=trainControl(method="cv", number=10),
                 tuneLength=10)
coef(elastic$finalModel, elastic$bestTune$lambda)
elastic.pred <- predict(elastic, Boston.test)
postResample(pred=elastic.pred, obs=Boston.test$medv)

models <- list(ridge=ridge, lasso=lasso, elastic=elastic)
summary(resamples(models), metric="RMSE")

summary(diff(resamples(models), metric="RMSE"))
