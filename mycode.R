
windows(width = 7, height = 5)

tinytex::install_tinytex()

avoid <- c("grey", "gray", "light", "dark", "medium", "deep", "1", "2", "3", "4")
colornames <- colors()
for (i in 1:length(keyword)) {
    colornames <- colornames[-grep(avoid[i], colornames)]
}
subset(colornames, nchar(colornames) < 9)

library(stargazer)
stargazer(data.frame(penguins), type="text")
