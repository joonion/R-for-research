# Unit 26: Linear Regression (2)

?lm

library(car)
str(Prestige)

?Prestige
df <- Prestige
plot(income ~ education, data = df, pch = 19, col = "steelblue")

cor(df$education, df$income)

formula <- income ~ education
lm(formula = formula, data = Prestige)

model <- lm(formula = formula, data = Prestige)
abline(model, lwd = 2, col = "tomato")

summary(model)

mod.summ <- summary(model)
coef(model.summ)

coef(model)
summary(resid(model))
confint(model)
anova(model)

library(car)
str(Prestige)
df <- subset(Prestige, select = c(2, 1, 3, 4))
str(df)
cor(df)

plot(df, pch = 19, col = "steelblue")

formula = income ~ education + women + prestige
lm(formula, data = df)

model <- lm(income ~ ., data = df)
summary(model)

library(stargazer)
stargazer(model, type="text", no.space = TRUE)

library(car)
formula <- income ~ education + I(education^2)
lm(formula, data = Prestige)

model <- lm(formula, data = Prestige)
summary(model)

plot(income ~ education, data = Prestige, pch = 19, col = "steelblue")
library(dplyr)
with(Prestige,
     lines(arrange(data.frame(education, fitted(model)), education), 
           lty = 1, lwd = 3, col = "tomato"))

?arrange
