# Two-independent-samples & paired-samples t-test

t.test(formula = Height ~ Sex, data = survey)

library(MASS)
?cats
str(cats)

?stargazer
library(stargazer)
stargazer(cats, type = "text")

?tapply
with(cats, tapply(Bwt, INDEX=list(Sex), FUN = mean))
with(cats, tapply(Hwt, INDEX=list(Sex), FUN = mean))

?t.test
t.test(formula = Bwt ~ Sex, data = cats)
t.test(formula = Hwt ~ Sex, data = cats)


?sleep
str(sleep)
sleep

library(tidyr)
spread(sleep, key = group, value = extra)

t.test(extra ~ group, data = sleep, paired = TRUE)

sleep.wide <- spread(sleep, key = group, value = extra)
names(sleep.wide) <- c("ID", "group.1", "group.2")

t.test(sleep.wide$group.1, sleep.wide$group.2, paired = T)

?split
split(sleep, f = group)
