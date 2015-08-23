# Code book for the UCI HAR tidied data

This document describes the two data tables that are produced by the `run_analysis.R` script. It draws
on the code book information provided with the UCI HAR dataset, in particular `features.txt` and `features_info.txt`.
In this study, 30 volunteers wore smartphones while performing a number of activities. The data from the phones' 
accelerometers and gyroscopes were used to capture 3-axial linear acceleration and 3-axial angular velocity. These signals
were filtered to remove noise. The accelerometer data were separated into acceleration due to gravity, and body
acceleration. Various statistics were computed from these data; our work here covers only the means and standard deviations
of each quantity. Many of the time-domain signals were transformed by the Fast Fourier Transform (FFT), with statistics
computed on the results in the frequency domain; here too we consider only the means and standard deviations.

The first table produced by the script is `goodtbl`. The first two columns indicate the observation, by activity
and subject.  The second table is `avgtbl`, which the script writes to
`tidytable.txt`. The column descriptions for the two tables are identical, with the implicit understanding that
`goodtbl` contains individual measurements, while `avgtbl` is averaged by activity and subject.  

Activity is a string with one of these values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING.

Subject is an integer from 1 to 30. It is the identification of the 30 volunteers in the study who wore smartphones on
their waists for the measurements.

The remaining columns are the measurements in alphabetical order. For conciseness, we denote 3-axial values in X, Y and Z
as [XYZ] in the column names. For example, `fBodyAccJerkMean.[XYZ]` refers to three measurements `fBodyAccJerkMean.X`,
`fBodyAccJerkMean.Y`, `fBodyAccJerkStd.Z`.

All the features have been normalized to the interval `[-1, 1]` as is desirable for machine learning algorithms.
This means the features do not have physical units. All the items with "Jerk" in the variable name refer to the
first derivative with respect to time of the measured quantity.

Note that some of the FFT quantities begin with "fBodyBody". It is not clear what the two "Bodys" mean.

* `fBodyAccJerkMean.[XYZ], fBodyAccJerkStd.[XYZ]`: mean and standard deviation of FFT of 3-axis body 
acceleration "jerk" (first time derivative).
* `fBodyAccMagMean, fBodyAccMagStd`: mean and standard deviation of FFT of Euclidean magnitude of body acceleration.
* `fBodyAccMean.[XYZ], fBodyAccStd.[XYZ]`: mean and standard deviation of FFT of body acceleration.
* `fBodyBodyAccJerkMagMean, fBodyBodyAccJerkMagStd`: mean and standard deviation of FFT of Euclidean magnitude  of body acceleration
 "jerk" (first time derivative).
* `fBodyBodyGyroJerkMagMean, fBodyBodyGyroJerkMagStd`: mean and standard deviation of FFT of body angular velocity "jerk" 
(first time derivative).
* `fBodyBodyGyroMagMean, fBodyBodyGyroMagStd`: mean and standard deviation of FFT of Euclidean magnitude of body angular velocity
* `fBodyGyroMean.[XYZ], fBodyGyroStd.[XYZ]`: mean and standard deviation of FFT of 3-axis angular velocity
* `tBodyAccJerkMagMean, tBodyAccJerkMagStd`: mean and standard deviation of Euclidean magnitude  of body acceleration
 "jerk" (first time derivative). 
* `tBodyAccJerkMean.[XYZ], tBodyAccJerkStd.[XYZ]`: mean and standard deviation of 3-axis body acceleration
 "jerk" (first time derivative).
* `tBodyAccMagMean, tBodyAccMagStd`: mean and standard deviation of Euclidean magnitude  of body acceleration
 "jerk" (first time derivative).
* `tBodyAccMean.[XYZ], tBodyAccStd.[XYZ]`:  mean and standard deviation of 3-axis body acceleration.
* `tBodyGyroJerkMagMean, tBodyGyroJerkMagStd`: mean and standard deviation of Euclidean magnitude of body angular velocity "jerk" 
(first time derivative).
* `tBodyGyroJerkMean.[XYZ], tBodyGyroJerkStd.[XYZ]`: mean and standard deviation of 3-axis body angular velocitu "jerk" 
(first time derivative).
* `tBodyGyroMagMean, tBodyGyroMagStd`: mean and standard deviation of Euclidean magnitude of body angular velocity
* `tBodyGyroMean.[XYZ], tBodyGyroStd.[XYZ]`: mean and standard deviation of 3-axis body angular velocity
* `tGravityAccMagMean, tGravityAccMagStd`: mean and standard deviation of the Euclidean magnitude of acceleration due to gravity.
* `tGravityAccMean.[XYZ], tGravityAccStd.[XYZ]`: mean and standard deviation of 3-axis acceleration due to gravity.

