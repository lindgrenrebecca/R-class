install.packages("plyr")
library(plyr)

#Set working directory
setwd("/Users/rebeccalindgren/Documents/GitHub/R-class")

#Read in the txt file provided
data <- read.table("Assignment_6_Dataset.txt", header = T, sep = ",")

#Step 1: Run the commend "mean" using Sex as the category (use plyr package for this operation). 
#Last command in this step: write the resulting output to a file.

#Using the ddply() function to find the mean age and grade for each Sex
data_2 <- ddply(data, "Sex", transform, Average_Grade = mean(Grade), Average_Age = mean(Age))
#Write the resulting dataframe to a file
write.table(data_2, "AverageAgeGradebySex.txt")
#Reading in that table to make sure it worked
data_3 <- read.table("AverageAgeGradebySex.txt") #worked!

#Step 2: Convert the data set to a dataframe for names whos' name contains the letter i, 
#then create a new data set with those names, Write those names to a file separated by comma’s (CSV)

names_with_i <- subset(data_2, grepl("i", data_2$Name, ignore.case = T))
write.csv(names_with_i, "NamesWithI.csv")

