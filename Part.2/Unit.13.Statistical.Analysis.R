# Unit 13. Statistical Analysis

library(MASS)
str(survey)
?survey

# 범주형 변수의 데이터 탐색

levels(survey$W.Hnd)

freq.tab <- table(survey$W.Hnd)
freq.tab

freq.prop <- prop.table(freq.tab)
freq.prop

barplot(freq.tab)
barplot(freq.tab, col = "steelblue")
barplot(freq.tab, col = "steelblue", 
        xlab = "Writing Hand", ylab = "Frequency", 
        main = "Frequency table of writing hand")

# 연속형 변수의 데이터 탐색

survey$Height

height <- survey$Height
length(height)
mean(height)
mean(height, na.rm = T)
median(height, na.rm = T)
max(height, na.rm = T)
min(height, na.rm = T)
quantile(height, probs = 0.9, na.rm = T)
quantile(height, probs = c(0.25, 0.75), na.rm = T)

hist(height)
hist(height, col = "steelblue")
hist(height, col = "steelblue", breaks = 15)
hist(height, col = "steelblue", breaks = 15,
     xlim = c(140, 210), ylim = c(0, 50))

str(survey)
df <- subset(survey, select = c(2, 3, 6, 10, 12))
summary(df)

library(stargazer)
stargazer(survey, type = "text", title = "Summary of survey dataset") 

# 집단별 기술통계량

mean(survey$Pulse, na.rm = T)
table(survey$Sex)
table(survey$Exer)

tapply(survey$Pulse, INDEX = survey$Sex, FUN = mean, na.rm = T)
with(survey, tapply(Pulse, Sex, mean, na.rm = T))
with(survey, tapply(Pulse, Exer, mean, na.rm = T))
with(survey, tapply(Pulse, list(Sex, Exer), mean, na.rm = T))

aggregate(survey$Pulse, by = survey$Exer, FUN = mean, na.rm = T)
aggregate(survey$Pulse, by = list(survey$Exer), FUN = mean, na.rm = T)
with(survey, aggregate(Pulse, list(Exercise=Exer), mean, na.rm = T))

library(vcd)
str(Arthritis)
?Arthritis

table(Arthritis$Improved, Arthritis$Treatment)
with(Arthritis, table(Improved, Treatment))
xtabs(~ Improved + Treatment, data = Arthritis)

mosaic(Improved ~ Treatment, data = Arthritis, gp = shading_max)

cross.tab <- with(Arthritis, table(Improved, Treatment))
margin.table(cross.tab, margin = 1)
margin.table(cross.tab, margin = 2)

prop.table(cross.tab)
prop.table(cross.tab, margin = 1)
prop.table(cross.tab, margin = 2)

addmargins(cross.tab)
addmargins(cross.tab, margin = 1)
addmargins(cross.tab, margin = 2)

library(gmodels)
with(Arthritis, CrossTable(Improved, Treatment, 
                           prop.r = F, prop.c = F, prop.t = T, prop.chisq = F))

cross.tab <- with(Arthritis, table(Improved, Sex, Treatment))
ftable(cross.tab)
ftable(cross.tab, row.vars = c(2, 3))

ftable(prop.table(cross.tab, margin = c(2, 3)))





?CrossTable
?prop.table

class(survey$W.Hnd)
levels(survey$W.Hnd)
table(survey$W.Hnd)

freq.tbl <- table(survey$W.Hnd)
barplot(freq.tbl, col = "steelblue", 
        xlab = "Writing Hand", ylab = "Frequency", 
        main = "Barplot for survey$W.Hnd")

df <- subset(survey, select = c("Height", "Age", "Wr.Hnd", "NW.Hnd"))
summary(df)

library(stargazer)
stargazer(survey, type = "text", title = "Summary of survey dataset") 

?stargazer
var(survey$Height, na.rm = TRUE)
sd(survey$Height, na.rm = TRUE)
median(survey$Height, na.rm = TRUE)

?hist
with(survey, hist(Height, col = "steelblue"))
with(survey, hist(Height, col = "steelblue", breaks = 20))

set.seed(123)
height <- na.omit(survey$Height)
sample.size <- 30
X_bars <- c()
for (i in 1:10000) {
    selected <- sample(height, size = sample.size, replace = F)
    X_bars <- c(X_bars, mean(selected))
}
mean(X_bars)
sd(X_bars)
sd(height) / sqrt(sample.size)

?shapiro.test
shapiro.test(rnorm(100, mean = 175, sd = 10))
shapiro.test(runif(100, min = 150, max = 200))
shapiro.test(survey$Height)
