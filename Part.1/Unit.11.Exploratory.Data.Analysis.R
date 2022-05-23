# Unit 11. Exploratory Data Analysis

library(mlbench)
data("BostonHousing")
?BostonHousing
str(BostonHousing)

df <- subset(BostonHousing, select = c("crim", "rm", "tax", "lstat", "medv"))
par(mfrow = c(2, 5))
for (i in 1:5) {
    hist(df[, i], col = "skyblue", main = colnames(df)[i])
}
for (i in 1:5) {
    boxplot(df[, i], col = "orange", main = colnames(df)[i])
}
par(mfrow = c(1, 1))

summary(df$medv)
df$price <- ifelse(df$medv > 25, "high", 
                   ifelse(df$medv < 17.0, "low", "med"))
df$price <- factor(df$price, levels = c("low", "med", "high"))
table(df$price)

colors = c("orange", "tomato", "salmon")
barplot(table(df$price), col = colors, main = "주택가격별 분류")

par(mfrow = c(1, 2))
boxplot(df$crim ~ df$price, col = "lightgray", outcol = colors, border = colors,
        main = "주택가격별 범죄발생률")
boxplot(df$lstat ~ df$price, col = "lightgray", outcol = colors, border = colors,
        main = "주택가격별 하위계층비율")
par(mfrow = c(1, 1))

str(df)
with(df, boxplot(rm ~ price, col = "lightgray", outcol = colors, border = colors))

colors <- as.numeric(df$price) + 1
plot(df[, 1:5], pch = 19, col = adjustcolor(colors, alpha = 0.3))

plot(df[, c(5, 4)], pch = 19, col = adjustcolor(colors, alpha = 0.8))


library(palmerpenguins)
str(penguins)

barplot(table(penguins$species), col = "steelblue")

library(VIM)
aggr(penguins, prop = F, numbers = T)
df.omit <- na.omit(penguins)
dim(df.omit)

library(ggplot2)
ggplot(data = penguins, aes(x = bill_length_mm, y = bill_depth_mm, group = species)) +
    geom_point(aes(color = species, shape = species), size = 3, alpha = 0.8) +
    geom_smooth(method = "lm", se = FALSE, aes(color = species)) +
    scale_color_manual(values = c("darkorange","purple","cyan4")) +
    labs(title = "Penguin bill dimensions",
         subtitle = "Bill length and depth for Adelie, Chinstrap and Gentoo penguins",
         x = "Bill length (mm)",
         y = "Bill depth (mm)",
         color = "Penguin species",
         shape = "Penguin species") +
    theme(legend.position = c(0.85, 0.15),
          plot.title.position = "plot",
          plot.caption = element_text(hjust = 0, face= "italic"),
          plot.caption.position = "plot")

ggplot(data = penguins, aes(x = flipper_length_mm)) +
    geom_histogram(aes(fill = species), alpha = 0.5, position = "identity") +
    scale_fill_manual(values = c("darkorange","purple","cyan4")) +
    labs(x = "Flipper length (mm)", y = "Frequency", title = "Penguin flipper lengths")

ggplot(data = penguins, aes(x = species, y = flipper_length_mm, color = species)) +
    geom_boxplot(width = 0.3, show.legend = F) +
    geom_jitter(alpha = 0.5, show.legend = F, position = position_jitter(width = 0.2, seed = 0)) +
    scale_color_manual(values = c("darkorange","purple","cyan4")) +
    labs(x = "Species", y = "Flipper length (mm)")
