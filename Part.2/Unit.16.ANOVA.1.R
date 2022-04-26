# Unit 16. ANOVA: One-way ANOVA, Two-way ANOVA

str(InsectSprays)

with(InsectSprays, tapply(count, spray, length))
with(InsectSprays, tapply(count, spray, mean))
with(InsectSprays, tapply(count, spray, sd))

aov(count ~ spray, data = InsectSprays)

sprays.aov <- aov(count ~ spray, data = InsectSprays)
summary(sprays.aov)

model.tables(sprays.aov, type = "mean")
model.tables(sprays.aov, type = "effects")


TukeyHSD(sprays.aov)
plot(TukeyHSD(sprays.aov), col = "darkblue", las = 1)



str(ToothGrowth)
df <- ToothGrowth
df$dose <- factor(df$dose, 
                  levels = c(0.5, 1.0, 2.0),
                  labels = c("low", "mid", "high"))
str(df)

with(df, tapply(len, list(supp, dose), length))
with(df, tapply(len, list(supp, dose), mean))
with(df, tapply(len, list(supp, dose), sd))

aov(len ~ supp * dose, data = df)

tooth.aov <- aov(len ~ supp * dose, data = df)
summary(tooth.aov)

model.tables(tooth.aov, type = "mean")
model.tables(tooth.aov, type = "effects")

TukeyHSD(tooth.aov)
TukeyHSD(tooth.aov, which = c("dose"), conf.level = 0.99)

