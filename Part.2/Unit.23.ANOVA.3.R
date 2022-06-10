# Unit 23. ANOVA (3): Repeated-Measures, ANCOVA, MANOVA

# repeated-measures two-way ANOVA

str(CO2)
head(CO2, 3); tail(CO2, 3)

CO2sub <- subset(CO2, Treatment=="chilled")
CO2sub$conc <- factor(CO2sub$conc)
CO2sub.aov <- aov(uptake ~ Type * conc + Error(Plant/conc), data=CO2sub)
summary(CO2sub.aov)

par(mar=c(6,4,4,2))
boxplot(uptake ~ Type * conc, data=CO2sub,
        col=c("deepskyblue", "violet"), las=2, cex.axis=0.75,
        ylab="Carbon dioxide uptake rate",
        main="Effects of Plant Type and CO2 on Carbon Dioxide Uptake")
legend("topleft", inset=0.02, 
       legend=c("Quebec", "Mississippi"), fill=c("deepskyblue", "violet"))

library(HH)
interaction2wt(uptake ~ conc * Type, data=CO2sub)

# ANCOVA

library(faraway)
str(sexab)

tapply(sexab$ptsd, sexab$csa, mean)
tapply(sexab$ptsd, sexab$csa, sd)
tapply(sexab$ptsd, sexab$csa, length)

sexab.aov <- aov(ptsd ~ cpa + csa, data=sexab)
summary(sexab.aov)

library(effects)
effect("csa", sexab.aov)

library(HH)
ancova(ptsd ~ cpa + csa, data = sexab)

# MANOVA

library(heplots)
str(Skulls)

library(dplyr)
sample_n(Skulls, 10)

y <- with(Skulls, cbind(mb, bh, bl, nh))
with(Skulls, aggregate(y, by=list(epoch), FUN=mean))

Skulls.manova <- with(Skulls, manova(y ~ epoch))
summary(Skulls.manova)

summary.aov(Skulls.manova)
