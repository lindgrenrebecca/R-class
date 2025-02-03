Freq <- c(.6, .3, .4, .4, .2, .6, .3, .4, .9, .2)
bloodp <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)
first <- c("bad", "bad", "bad", "bad", "good", "good", "good", "good", NA, "bad")
second <- c("low", "low", "high", "high","low", "low","high", "high","high", "high")
finaldecision <- c("low", "high", "low", "high", "low", "high", "low", "high", "high", "high")

first <- ifelse(first == "bad", 1, 0)
second <- ifelse(second == "low", 0, 1)
finaldecision <- ifelse(finaldecision == "low", 0, 1)

df <- data.frame(Freq, bloodp, first, second, finaldecision)

hist(df$bloodp)
boxplot(df$bloodp)