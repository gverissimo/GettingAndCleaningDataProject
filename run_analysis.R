## rm(list=ls()) # clear workspace

library(dplyr)
library(reshape2)

## ****************************************************************
## (1) LOAD LABELS FOR ACTIVITIES & FEATURES

activity_labels <- read.table(
        "./data/UCI HAR Dataset/activity_labels.txt", 
        header=FALSE, 
        colClasses=c(numeric(), character()),
        stringsAsFactors=FALSE
        )
activity_labels <- as.vector(activity_labels[,2])
activity_labels <- tolower(activity_labels)

feature_variables <- read.table(
        "./data/UCI HAR Dataset/features.txt", 
        header=FALSE, 
        colClasses=c(numeric(), character()),
        stringsAsFactors=FALSE
        )
feature_variables <- as.vector(feature_variables[,2])

## ****************************************************************
## (2) IDENTIFY TARGET FEATURES, ie - just mean() & std() variables
##
## note - 
## not exactly sure what meanFreq refers to, and  I assumed mean & std 
## need to be paired statistics. And since meanFreq isn't paired with any
## form of stdFreq, I left those variables out.
target_features <- sort(grep("mean\\(\\)|std\\(\\)", feature_variables, value=FALSE))

## ...and Clean up target feature labels
target_feature_labels <- feature_variables[target_features] %>% 
        ## first removing parenthesis 
        gsub(pattern="\\(", replacement="") %>%
        gsub(pattern="\\)", replacement="") %>%
        ## then removing hyphens
        gsub(pattern="-", replacement="") %>%
        ## tben capitalizing "Mean" and "Std"
        gsub(pattern="mean", replacement="Mean") %>%
        gsub(pattern="std", replacement="Std") %>%
        ## replace prefix 't'/'f' with "Time"/"Freq"
        gsub(pattern="^t", replacement="Time") %>%
        gsub(pattern="^f", replacement="Freq")

## ****************************************************************
## (3) LOAD TEST DATASETS

## load subjects
test_subjects <- read.table(
        "./data/UCI HAR Dataset/test/subject_test.txt", 
        header=FALSE, 
        col.names = c("subjectNumber"),
        stringsAsFactors=FALSE
)

## load activities
test_activities <- read.table(
        "./data/UCI HAR Dataset/test/y_test.txt", 
        header=FALSE, 
        col.names = c("activityNumber"),
        stringsAsFactors=FALSE)
## add activity names (as a factor) using mutate and table lookup from activity_labels
test_activities <- mutate(test_activities, activityName=as.factor(activity_labels[activityNumber]))

## load measurements
test_measurements <- read.table(
        "./data/UCI HAR Dataset/test/X_test.txt", 
        header=FALSE, 
        col.names=feature_variables,
        stringsAsFactors=FALSE
)
## select target columns and add column names
target_test_measurements <- test_measurements[,target_features]
colnames(target_test_measurements) <- target_feature_labels

## merge dataframes: subjects + activities + measurements
test_df <- cbind(test_subjects, test_activities, target_test_measurements)
## add dataset identifier (ie - test/train)
test_df$dataset <- as.factor("test")

## optional - free up space
rm(test_subjects, test_activities, test_measurements, target_test_measurements)


## ****************************************************************
## (4) LOAD TRAINING DATASETS

## load subjects
train_subjects <- read.table(
        "./data/UCI HAR Dataset/train/subject_train.txt", 
        header=FALSE, 
        col.names = c("subjectNumber"),
        stringsAsFactors=FALSE
)

## load activities
train_activities <- read.table(
        "./data/UCI HAR Dataset/train/y_train.txt", 
        header=FALSE, 
        col.names = c("activityNumber"),
        stringsAsFactors=FALSE)
## add activity names (as a factor) using mutate and table lookup from activity_labels
train_activities <- mutate(train_activities, activityName=as.factor(activity_labels[activityNumber]))

## load measurements
train_measurements <- read.table(
        "./data/UCI HAR Dataset/train/X_train.txt", 
        header=FALSE, 
        col.names=feature_variables,
        stringsAsFactors=FALSE
)
## select target columns
target_train_measurements <- train_measurements[,target_features]
## add measurement column names
colnames(target_train_measurements) <- target_feature_labels

## merged dataframes: subjects + activities + measurements
train_df <- cbind(train_subjects, train_activities, target_train_measurements)
## for bookeeping, add dataset identifier (ie - test/train)
train_df$dataset <- as.factor("train")

## optional - free up space
rm(train_subjects, train_activities, train_measurements, target_train_measurements)


## ****************************************************************
## (5) MERGE TEST & TRIAL DATASETS & SUMMARIZE

## merge datasets (test + train)
fullDataset <- rbind(test_df, train_df)
## sort full dataset by subject > activity > 
fullDataset <- arrange(fullDataset, subjectNumber, activityName, dataset)
## musing melt, reshape dataset into long format around subject & activity
meltedDataset <- melt(
        fullDataset, 
        id.var=c("subjectNumber", "activityName"), 
        measure.var=target_feature_labels,
       )
## using dcast, reshape dataset back into wide format with averages
meanDataset <- dcast(
        meltedDataset,
        subjectNumber + activityName ~ variable, 
        mean
        )

## ****************************************************************
## (6) WRITE TIDY FILE

# write file tab-delimited text file (via escape character '\t')
write.table(meanDataset, "tidy.txt", sep="\t", row.names=FALSE, quote=FALSE)
