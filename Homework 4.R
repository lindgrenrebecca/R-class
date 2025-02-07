#Write vectors
Freq <- c(.6, .3, .4, .4, .2, .6, .3, .4, .9, .2)
bloodp <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)
first <- c("bad", "bad", "bad", "bad", "good", "good", "good", "good", NA, "bad")
second <- c("low", "low", "high", "high","low", "low","high", "high","high", "high")
finaldecision <- c("low", "high", "low", "high", "low", "high", "low", "high", "high", "high")

#Switch words to binary variable
first <- ifelse(first == "bad", 1, 0)
second <- ifelse(second == "low", 0, 1)
finaldecision <- ifelse(finaldecision == "low", 0, 1)

#Set up a 2x2 plot space for four plots
par(mfrow = c(2, 2))
#Histograms
hist(bloodp, main = "Blood Pressure")
hist(finaldecision, breaks = c(-0.5, 0.5, 1.5), xlim = c(-0.5, 1.5), main = "Decision of Treatment")
#Boxplots
boxplot(bloodp, horizontal = T, main = "Blood Pressure")
boxplot(finaldecision, horizontal = T, main = "Decision of Treatment")
