data <- read.csv("HI.csv")
library(ggplot2)
library(dplyr)

#create levels for the factor variable "Education"
education_order <- c("<9years", "9-11years", "12years", "13-15years", "16years", ">16years")

#make a new df for mean hours worked per education level
data_summary <- data |>
  group_by(education) |>
  summarise(mean_whrswk = mean(whrswk)) |>
  mutate(education = factor(education, levels = education_order))

#First plot: Histogram
ggplot(data_summary, aes(x = education, y = mean_whrswk)) + 
  geom_col(fill = "purple") +
  labs(x = "Education Level", y = "Avg. Hrs Worked Per Week")

#Second plot: what if we use median hours worked instead?
data_median <- data |>
  group_by(education) |>
  summarise(median_whrswk = median(whrswk)) |>
  mutate(education = factor(education, levels = education_order))

ggplot(data_median, aes(x = education, y = median_whrswk)) + 
  geom_col(fill = "purple") +
  labs(x = "Education Level", y = "Median Hrs Worked Per Week")

#Third plot: Scatterplot (full dataset)
ggplot(data, aes(x = whrswk, y = husby)) +
  geom_point(size = 0.5) +
  labs(x = "Hrs Worked Per Week", y = "Husband's Income (in thousands)")

#Fourth plot: Scatterplot with a sample of the dataset and correlation line
data_sample <- data |>
  sample_n(500)

ggplot(data_sample, aes(x = whrswk, y = husby)) +
  geom_point(size = 0.5) +
  geom_smooth(method = "lm", color = "red", se = T) +
  labs(x = "Hrs Worked Per Week", y = "Husband's Income (in thousands)")

cor(data$whrswk, data$husby) #equals 0.019




