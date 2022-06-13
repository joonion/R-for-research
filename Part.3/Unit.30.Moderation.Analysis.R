# Unit 30. Moderation Analysis

mtcars.lm <- lm(mpg ~ hp + wt + hp:wt, data=mtcars)
summary(mtcars.lm)

summary(lm(mpg ~ hp * wt, data=mtcars))

m <- round(mean(mtcars$wt), 1); m
s <- round(sd(mtcars$wt), 1); s

library(effects)
plot(effect(term="hp:wt", mod=mtcars.lm, xlevels=list(wt=c(m-s, m, m+s))), 
     lines=list(multiline=TRUE, lwd=2, lty=c(3, 2, 1), 
                col=c("royalblue", "violet", "maroon")),
     main="Interaction Plot for Horsepower and Weight")

library(rockchalk)
plotSlopes(model=mtcars.lm, plotx="hp", modx="wt", modxVals="std.dev.", 
           pch=21, col=rainbow(3), cex=1, bg="dimgray",
           main="Interaction Plot for Horsepower and Weight")

model.M <- lm(wt ~ disp * am, data = mtcars)
model.Y <- lm(mpg ~ disp * am + wt * am, data = mtcars)

library(mediation)
set.seed(123)
model.med1 <- mediate(model.m = model.M, model.y = model.Y, 
                      covariates = list(am = 0),
                      treat = "disp", mediator = "wt", boot = T, sims = 500)

set.seed(123)
model.med2 <- mediate(model.m = model.M, model.y = model.Y, 
                      covariates = list(am = 1),
                      treat = "disp", mediator = "wt", boot = T, sims = 500)

summary(model.med1)
summary(model.med2)

set.seed(12)
model.med <- mediate(model.m = model.M, model.y = model.Y,
                     treat = "disp", mediator = "wt", sims = 500)

set.seed(12)
test.modmed(object = model.med,
            covariates.1 = list(am = 0), covariates.2 = list(am = 1), sims = 500)
