# Tidy the UCI HAR dataset
#   assuming the dataset is in the same directory as this script
#   (meaning, it was unzipped in the same directory as this script)
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(data.table)

# Read in the feature names
features <- read.csv("UCI\ Har\ Dataset/features.txt", sep=" ", header = FALSE,
                     stringsAsFactors = FALSE)

# Read in the activity labels
activities <- read.delim("UCI\ Har\ Dataset/activity_labels.txt", 
                         sep = " ", header = FALSE,
                         stringsAsFactors = FALSE)

# Read in the training and test sets
traindf <- read.fwf("UCI\ Har\ Dataset/train/X_train.txt", 
                    widths = rep.int(c(16), 561),
                    col.names = features$V2)
trainlabels <- read.delim("UCI\ Har\ Dataset/train/y_train.txt",
                          header = FALSE)
trainsubs <- read.delim("UCI\ Har\ Dataset/train/subject_train.txt",
                        header = FALSE)

testdf <- read.fwf("UCI\ Har\ Dataset/test/X_test.txt", 
                   widths = rep.int(c(16), 561), 
                   col.names = features$V2)
testlabels <- read.delim("UCI\ Har\ Dataset/test/y_test.txt",
                         header = FALSE)
testsubs <- read.delim("UCI\ Har\ Dataset/test/subject_test.txt",
                       header = FALSE)



# Merge the test and training data frames, and convert to data.table
datatbl <- data.table(rbind(traindf, testdf))
labeltbl <- data.table(rbind(trainlabels, testlabels))
subjecttbl <- data.table(rbind(trainsubs, testsubs))

datatbl <- datatbl[,activity := labeltbl$V1]
datatbl <- datatbl[,subject := subjecttbl$V1]

# Clean up variables            
#rm(list=c("testdf", "traindf", "labeltbl", "testlabels", "trainlabels",
#          "subjecttbl", "trainsubs", "testsubs"))

library(plyr)
library(dplyr)
# Get the column names with "mean" or "std", excluding "angle"

meantbl <- select(datatbl, contains("mean.."))
meantbl <- meantbl[, grep("^angle", colnames(meantbl), invert=TRUE), with=FALSE]
stdtbl <- select(datatbl, contains("std.."))
stdtbl <- stdtbl[, grep("^angle", colnames(stdtbl), invert=TRUE), with=FALSE]
firsttbl <- select(datatbl, one_of(c("activity", "subject")))

# Let's fix up the names of meantbl and stdtbl
mnames <- names(meantbl)
newmnames <- gsub(".mean..","Mean", mnames)
setnames(meantbl, mnames, newmnames)
snames <- names(stdtbl)
newsnames <- gsub(".std..","Std", snames)
setnames(stdtbl, snames, newsnames)

goodtbl <- cbind(firsttbl,meantbl,stdtbl)
                                   
# Substitute activity strings for numbers
goodtbl$activity <- plyr::mapvalues(goodtbl$activity,
                     from = activities$V1,
                     to = activities$V2)

# arrange the column names into alphabetical order
finalnames <- c("activity", "subject", sort(c(newmnames, newsnames)))
goodtbl <- select(goodtbl, one_of(finalnames))
goodtbl <- arrange(goodtbl, activity, subject)
# See http://stackoverflow.com/questions/21295936/can-dplyr-summarise-over-several-variables-without-listing-each-one
avgtbl <- goodtbl %>% 
    group_by(activity, subject) %>% 
    summarise_each(funs(mean)) %>%
    arrange(activity, subject)

write.table(avgtbl, file = "tidytable.txt", row.names = FALSE)

