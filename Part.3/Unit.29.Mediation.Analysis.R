# Unit 29. Mediation Analysis

data(mtcars)
model.total <- lm(mpg ~ disp, data = mtcars)
summary(model.total)

model.M <- lm(wt ~ disp, data = mtcars)
summary(model.M)

model.Y <- lm(mpg ~ disp + wt, data = mtcars)
summary(model.Y)

library(multilevel)
model.sob <- sobel(pred = mtcars$disp, med = mtcars$wt, out = mtcars$mpg)
model.sob

model.sob$Indirect.Effect
model.sob$SE
model.sob$z.value
model.sob$N

pnorm(model.sob$z.value) * 2

library(bda)
mediation.test(mv = mtcars$wt, iv = mtcars$disp, dv = mtcars$mpg)

library(mediation)
set.seed(123)
model.M <- lm(wt ~ disp, data = mtcars)
model.Y <- lm(mpg ~ disp + wt, data = mtcars)
model.mediate <- mediate(model.m = model.M, model.y = model.Y,
                         treat = "disp", mediator = "wt", boot = T, sims = 500)

summary(model.mediate)

plot(model.mediate, cex = 1.2, col = "royalblue", lwd = 2, 
     main = "Mediation Effect Analysis")
