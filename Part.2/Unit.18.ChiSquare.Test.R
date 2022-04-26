# Unit 18. Chi-Square Test

library(vcd)
data(package = "vcd")
?Arthritis

str(Arthritis)

with(Arthritis, table(Treatment, Improved))
with(Arthritis, table(Improved, Treatment))

xtabs(~ Treatment + Improved, data = Arthritis)
xtabs(~ Improved + Treatment, data = Arthritis)

library(gmodels)
with(Arthritis, CrossTable(Treatment, Improved))
with(Arthritis, CrossTable(Improved, Treatment))

with(Arthritis, chisq.test(Treatment, Improved))

arth.tab <- xtabs(~ Improved + Treatment, data = Arthritis)
mosaic(arth.tab, gp = shading_max)
# Independence Test

str(Titanic)

margin.table(Titanic, margin = c(4, 1))
titanic.margin <- margin.table(Titanic, margin = c(4, 1))
addmargins(titanic.margin)
addmargins(titanic.margin, 2)
prop.table(addmargins(titanic.margin, 2), 2)
addmargins(prop.table(addmargins(titanic.margin, 2), 2), 1)

chisq.test(titanic.margin)


library(MASS)
str(survey)
chisq.test(survey$Fold, survey$Sex)
table(survey$Fold, survey$Sex)

cross.tab <- table(survey$Fold, survey$Sex)
chisq.test(cross.tab)

# 적합성 검정: Goodness-of-Fit

str(HairEyeColor)
margin.table(HairEyeColor, margin = 1)
hairs <- margin.table(HairEyeColor, margin = 1)
chisq.test(hairs, p = c(0.25, 0.50, 0.10, 0.15))

library(MASS)
table(survey$Smoke)
smokers <- table(survey$Smoke)

chisq.test(smokers, p = c(0.1, 0.7, 0.1, 0.1))
