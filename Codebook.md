==================================================================
Getting and Cleaning Data Project Codebook
==================================================================

This project is to analyse the randomly partitioned training and test data sets collected from
the accelerometers from the Samsung Galaxy S smartphone and produce a tidy data that can be used for later
analysis.

A full description is available is available at the site below:
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data used in this project is available at the site below:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Input data

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables
- Its activity label. 
- An identifier of the subject who carried out the experiment. 

A features.txt file contains the information about the variables for the 561 features.

Data Cleaning and Analysis

The run_analysis.R module performs data cleaning and creates a tidy data following these steps:

1. Reads the training and test data sets, and the features and activity lables described in 
   the input file section.
2. Merges the training and test data sets including:
     a. measurement data sets 
     b. subject data sets that identifies who carried out the experiement.
     c. activity id data sets that identiifes the activity measured.
3. Associates activity id with  descriptive activity names by looking up from the activity labels.
4. Labels the data sets with descriptive variable names with the 561 features provided in the 
   features.txt file.
5. Extracts only the mean and standard deviation measurements in  each record
   by subsetting the measurement columns to include only the measurements contains *std*, 
   *mean*, *Std*, *Mean* string in their variables name.
6. From the resulting cleaned data set, creates an independentt tidy data set with the average of each
   variable for each activity and each subject.
   

Output Tidy Data Set 

In step 5 of the run_analysis described above, the mensurements for total of 86 mean and 
standard deviation variables were extracted. The average is computed for the measurements of
each of these 86 mean and standards variables grouped by subject and activity.
 
The record in the tidy data set includes:

- subject id that identifies who carried out the experiment. 
- activity id that identifies the activity for the measurement.
- activity name describes th eactivity.
- Average/mean value for each of the 86 mean and standard deviation measurments for 
  Triaxial acceleration from the accelerometer (total acceleration), the estimated body acceleration, 
  and the Triaxial Angular velocity from the gyroscope.


See README.md for steps to run run_analysis.R., and check the output file, tidy.txt produced by
run_analysis.R.
