# Unit 17. ANOVA(2): ANCOVA, Repeated-Measures, MANOVA

# 공분산 분석: ANCOVA

library(faraway)

str(sexab)

with(sexab, tapply(ptsd, csa, length))
with(sexab, tapply(ptsd, csa, mean))
with(sexab, tapply(ptsd, csa, sd))

aov(ptsd ~ cpa + csa, data = sexab)

sexab.aov <- aov(ptsd ~ cpa + csa, data = sexab)
summary(sexab.aov)

library(effects)
effect("csa", sexab.aov)

library(HH)
ancova(ptsd ~ cpa + csa, data = sexab)

# 반복측정 분산분석: Repeated-Measures Two-way ANOVA

str(CO2)

df <- subset(CO2, Treatment == "chilled")
df$conc <- factor(df$conc)
aov(uptake ~ Type * conc + Error(Plant/conc), data = df)


# 다변량 분산분석: MANOVA

library(heplots)
str(Skulls)

library(dplyr)
sample_n(Skulls, 10)

y <- with(Skulls, cbind(mb, bh, bl, nh))
with(Skulls, aggregate(y, by = list(epoch), FUN = mean))

manova(y ~ Skulls$epoch)

skulls.manova <- manova(y ~ Skulls$epoch)
summary(skulls.manova)

summary.aov(skulls.manova)
