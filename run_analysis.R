# run_analysis.R
# Coursera's Getting and cleaning data course project
# Author: José María Moreno Juez
# Date: 10th of February 2017
# Purpose: Create a tidy dataset.

# First we want to download the data from the following URL:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","AssingmentData.zip")
# Let's unzip the downloaded file
unzip("AssingmentData.zip")
# It will be a single folder called "UCI HAR Dataset". Move into it
setwd("UCI HAR Dataset")
# Read different activites into R table
activities <- read.table("activity_labels.txt",col.names = c("Index","Description"))
# Read features info into R table
features <- read.table("features.txt",col.names = c("Index","Description"))
setwd("./test/")
readings_test <- read.table("X_test.txt",col.names = features[["Description"]])
subject_test <- read.table("subject_test.txt",col.names = "Subject")
read_act <- read.table("y_test.txt",col.names = "Activity")
readings_test <- cbind(subject_test,readings_test)
readings_test <- cbind(read_act,readings_test)
# Substitude activity Index per its description
readings_test$Activity <- activities[match(readings_test$Activity,activities$Index),2]
setwd("../train/")
readings_train <- read.table("X_train.txt",col.names = features[["Description"]])
subject_train <-  read.table("subject_train.txt",col.names = "Subject")
read_act_train <- read.table("y_train.txt",col.names = "Activity")
readings_train <- cbind(subject_train,readings_train)
readings_train <- cbind(read_act_train,readings_train)
readings_train$Activity <- activities[match(readings_train$Activity,activities$Index),2]
# Merge both tables into big one
readings_table <- rbind(readings_test,readings_train)
# Get oly Mean Standar deviation Acivty & Subject Columns
readings_table_clean <- readings_table[,grep('(Mean|std|Subject|Activity)',colnames(readings_table))]
aggdata <- aggregate(readings_table_clean[,3:ncol(readings_table_clean)], by= list(readings_table_clean$Activity,readings_table_clean$Subject),FUN=mean,na.rm=TRUE)
colnames(aggdata)[2]<- "Subject"
colnames(aggdata)[1] <- "Activity"
names(aggdata) <- gsub ("\\.","",names(aggdata))
setwd("../..")
write.table(aggdata,file = "tidyData.txt",row.names = FALSE)
unlink("UCI HAR Dataset/" ,recursive = TRUE, force = TRUE)

                 



