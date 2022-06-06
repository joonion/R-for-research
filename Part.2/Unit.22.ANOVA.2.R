# Unit 22. ANOVA (2): one-way, two-way ANOVA

str(InsectSprays)

tapply(InsectSprays$count, InsectSprays$spray, mean)
tapply(InsectSprays$count, InsectSprays$spray, sd)
tapply(InsectSprays$count, InsectSprays$spray, length)

library(gplots)
plotmeans(count ~ spray, data=InsectSprays,
          main="Performance of Insect Sprays\nwith 95% CI of Mean",
          xlab="Type of Sprays", 
          ylab="Insect Count", 
          barcol="tomato", 
          barwidth=3, 
          col="cornflowerblue",
          lwd=2)

boxplot(count ~ spray, data=InsectSprays, col="tomato",
        xlab="Type of Sprays", ylab="Insect Count",
        main="Performance of Insect Sprays")

sprays.aov <- aov(count ~ spray, data=InsectSprays)
sprays.aov

summary(sprays.aov)

model.tables(sprays.aov, type="mean")
model.tables(sprays.aov, type="effects")
model.tables(sprays.aov)

sprays.compare <- TukeyHSD(sprays.aov)		
sprays.compare

sprays.compare$spray['D-C',]

plot(TukeyHSD(sprays.aov), col="blue", las=1)

library(multcomp)
tuk.hsd <- glht(model=sprays.aov, linfct=mcp(spray="Tukey"))
tuk.hsd

plot(cld(tuk.hsd, level=0.05), col="orange")

library(car)
qqPlot(InsectSprays$count, pch=20, col="deepskyblue", id=FALSE,
       main="Q-Q Plot", xlab="Theoretical Quantiles", ylab="Sample Quantiles")

shapiro.test(InsectSprays$count)

outlierTest(sprays.aov)

leveneTest(count ~ spray, data=InsectSprays)
bartlett.test(count ~ spray, data=InsectSprays)

oneway.test(count ~ spray, data=InsectSprays)

oneway.test(count ~ spray, data=InsectSprays, var.equal=TRUE)

str(ToothGrowth)

ToothGrowth$dose <- factor(ToothGrowth$dose, 
                           levels=c(0.5, 1.0, 2.0), labels=c("low", "med", "high"))
str(ToothGrowth)
ToothGrowth[seq(1, 60, 5),]

with(ToothGrowth, tapply(len, list(supp, dose), length))
with(ToothGrowth, tapply(len, list(supp, dose), mean))
with(ToothGrowth, tapply(len, list(supp, dose), sd))

ToothGrowth.aov <- aov(len ~ supp * dose, data=ToothGrowth)
ToothGrowth.aov <- aov(len ~ supp + dose + supp:dose, data=ToothGrowth)

summary(ToothGrowth.aov)

model.tables(ToothGrowth.aov, type="means")

boxplot(len ~ supp * dose, data=ToothGrowth,
        col=c("deeppink", "yellowgreen"), las=1,
        xlab="Vitamin C Type", ylab="Tooth Growth",
        main="Effects of Vitamin C on Tooth Growth of Guinea Pigs")

interaction.plot(x.factor=ToothGrowth$dose, trace.factor=ToothGrowth$supp, 
                 response=ToothGrowth$len, las=1, type="b", 
                 pch=c(1, 19), col=c("blue", "red"), trace.label="Supplement",
                 xlab="Dose Level", ylab="Tooth Length",
                 main="Interaction Plot for Tooth Growth of Guinea Pigs")

library(gplots)
plotmeans(len ~ interaction(supp, dose, sep=" "), data=ToothGrowth,
          connect=list(c(1,3,5), c(2,4,6)),
          col=c("red", "green3"),
          xlab="Supplement and Dose Combination", ylab="Tooth Length",
          main="Means Plot for Tooth Growth of Guinea Pigs\nwith 95% CI of Mean")

coplot(len ~ dose | supp, data=ToothGrowth, 
       col="steelblue", pch=19, 
       panel=panel.smooth, lwd=2, col.smooth="darkorange",
       xlab="Dose Level", ylab="Tooth Length")

library(HH)
windows(width=7.0, height=5.5)
interaction2wt(len ~ supp * dose,  data=ToothGrowth)

TukeyHSD(ToothGrowth.aov)

TukeyHSD(ToothGrowth.aov, which=c("dose"), conf.level=0.99)
