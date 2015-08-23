
# Tidying the UCI Human Activity Recognition Dataset

This repository contains the details of tidying the UCI Har Dataset. This dataset is
"Human Activity Recognition Using Smartphones Data Set" and is described 
[here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
In this study, 30 volunteers wore a Samsung Galaxy SII smartphone on their waists while
performing six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING.
Data from the phone's accelerometers and gyroscope were recorded at 50 Hz to yield
3-axial linear acceleration and 3-axial angular velocity.

The attribution for this dataset is:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
  1. Smartlab - Non-Linear Complex Systems Laboratory 
  DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
  2. CETpD - Technical Research Centre for Dependency Care and Autonomous Living
  Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
   activityrecognition '@' smartlab.ws

The actual dataset files were not taken from the UCI site, but were provided by the
"Getting and Cleaning Data" course 
[as this zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Transformations and tidying
The R script that transforms the data is `run_analysis.R`. The script assumes that the
dataset has been unzipped in the same directory as the script. Broadly, here are the
transformations that were made:

1. Read in the feature names and activity labels from these files:
  1. `features.txt`
  2. `activity_labels.txt`
2. Read in the training data and test data. Column names from `features.txt` were 
included at the time of reading the measurements. These files were read:
  1. `train/X_train.txt` (numeric values -- the measurements)
  2. `train/y_train.txt` (integer activity labels)
  3. `train/subject_train.txt` (integer subject labels)
  1. `test/X_test.txt` (numeric values -- the measurements)
  2. `test/y_test.txt` (integer activity labels)
  3. `test/subject_test.txt` (integer subject labels)
3. Combine the training and test data, and the activity and subject labels, into a single data table `datatbl`.
4. Select only the measurements that are means or standard deviations into a new table `goodtbl`,
retaining the activity and subject labels
5. Substitute string activity labels for the numeric ones, to be more descriptive
6. Clean up the measurement names to be a little more human-readable (camelCase) and sort alphabetically.
7. Sort `goodtbl` by activity and then subject.
8. For all the measurement means and standard deviations, compute the mean by activity and subject, and
place the result in `avgtbl`. Write `avgtbl` to a file `tidytable.txt`.

## Code book

The code book is provided in CodeBook.md. It describes the variables, the data, and 
the transformations performed to clean up the data. The code book adds to the code book materials
that were provided with the data, and indicate all the variables and summaries that were calculated,
including units and any other relevant information.



