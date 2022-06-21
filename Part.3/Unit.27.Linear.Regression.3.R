# Unit 27. Linear Regression (3)

?mtcars

str(mtcars)

df <- subset(mtcars, select = 1:6)
str(df)

cor(df)

library(car)
scatterplotMatrix(df, pch = 19, col = "steelblue", cex = 1.2,
                  regLine = list(method = lm, lwd = 2, col = "tomato"),
                  smooth = list(smoother = loessLine, spread = FALSE, 
                                lwd.smooth = 2, col.smooth = "orange"))

model <- lm(mpg ~ cyl + disp + hp + drat + wt, data = df)
summary(model)

model <- lm(mpg ~ hp + wt, data = df)
summary(model)

model <- lm(mpg ~ wt, data = df)
summary(model)

plot(model)

mtcars.lm1 <- lm(mpg ~ hp + wt, data = mtcars)
mtcars.lm2 <- lm(mpg ~ hp + wt + disp + drat, data=mtcars)
anova(mtcars.lm1, mtcars.lm2)

AIC(mtcars.lm1, mtcars.lm2)

mtcars.lm <- lm(mpg ~ hp + wt + disp + drat, data=mtcars)
step(mtcars.lm, direction="backward")

str(InsectSprays)
levels(InsectSprays$spray)
tapply(InsectSprays$count, InsectSprays$spray, mean)

sprays.lm <- lm(count ~ spray, data=InsectSprays)
summary(sprays.lm)

contrasts(InsectSprays$spray)

sprays.aov <- aov(count ~ spray, data=InsectSprays)
summary(sprays.aov)
TukeyHSD(sprays.aov)

respray <- relevel(InsectSprays$spray, ref=6)
sprays.lm <- lm(count ~ respray, data=InsectSprays)
summary(sprays.lm)

contrasts(relevel(InsectSprays$spray, ref=6))
