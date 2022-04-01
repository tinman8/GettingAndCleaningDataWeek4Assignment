library(dplyr)
## script to tidy data from the "UCI HAR Dataset". Creates a unified dataset
## of the X, y, and subject data, with only mean and standard deviation
## variables. Outputs a tidy dataset with the average of each variable for 
## each activity and subject


## Setup the data folder and get data
url_to_dataset <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!dir.exists("./data/")) {
    download.file(url_to_dataset, destfile = "./data.zip")
    unzip("./data.zip", exdir = "./data/")
    file.remove("./data.zip")
}

## Paths to all relevant data
path_to_features_list <- "./data/UCI HAR Dataset/features.txt"
path_to_activity_labels <- "./data/UCI HAR Dataset/activity_labels.txt"
training_data <- list(
    X = "./data/UCI HAR Dataset/train/X_train.txt", 
    y = "./data/UCI HAR Dataset/train/y_train.txt", 
    subject = "./data/UCI HAR Dataset/train/subject_train.txt"
)
testing_data <- list(
    X = "./data/UCI HAR Dataset/test/X_test.txt", 
    y = "./data/UCI HAR Dataset/test/y_test.txt", 
    subject = "./data/UCI HAR Dataset/test/subject_test.txt"
)


## function to import data and create a dataframe using dplyr
import_data <- function (path_to_data, ...) {
    file(description = path_to_data) %>%
        read.table(., ...) %>%
        as_tibble()
}

## function to process the X data
process_X_data <- function(path_to_X) {
    col_names <- import_data(path_to_features_list)
    col_names[2] <- col_names[[2]] %>%  ## format the variable names
        gsub("\\-", "_", .) %>%
        gsub("\\(\\)", "", .) %>%
        gsub("\\)", "", .) %>%
        gsub("\\(", "_", .) %>%
        gsub("\\,", "_", .) %>%
        tolower()

    import_data(path_to_X, col.names = col_names[[2]]) %>%
        select(., matches("mean"), matches("std"))
}

## function to process the y data
process_y_data <- function(path_to_y) {
    df <- import_data(path_to_y, col.names = c("activity"))
    activities <- import_data(path_to_activity_labels)
    df$activity %>% factor(
        ., levels = activities[[1]], labels = tolower(activities[[2]])
    )
    df
}

## function to process the subject data
process_subject_data <- function(path_to_subject) {
    import_data(path_to_subject, col.names = c("subject"))
}

## function to join x, y, and subject data into one dataframe
join_X_y_subject <- function(X, y, subject) {
    cbind(subject, y) %>% cbind(., X)
}


## function to join the training and test
join_train_and_test_data <- function(test, train) {
    rbind(test, train) %>%
        arrange(subject, activity)
}

## Putting it all together
## process the training data
training_X <- process_X_data(training_data$X)
training_y <- process_y_data(training_data$y)
training_subject <- process_subject_data(training_data$subject)

## process the testing data
testing_X <- process_X_data(testing_data$X)
testing_y <- process_y_data(testing_data$y)
testing_subject <- process_subject_data(testing_data$subject)

## merge training set and merge testing set
complete_training <- join_X_y_subject(training_X, training_y, training_subject)
complete_testing <- join_X_y_subject(testing_X, testing_y, testing_subject)

## merge training and testing into single dataset
complete_dataset <- join_train_and_test_data(
    complete_training, complete_testing
)

## create the summary dataset first by grouping data by the activity and subject
## then summaries all the X variables using the mean function 
summary_dataset <- complete_dataset %>% 
    group_by(activity, subject) %>%
    summarise(across(tbodyacc_mean_x:fbodybodygyrojerkmag_std, mean))

# write the tidy dataset to csv file
write.table(summary_dataset, file = "./tidy_dataset.txt", row.names = FALSE)

# clean up the environment
rm(list = c(
    "df",
    "training_X", 
    "training_y", 
    "training_subject", 
    "testing_X", 
    "testing_y", 
    "testing_subject",
    "complete_testing",
    "complete_training"
))