# Code Book for Getting and Cleaning Data Course Project
This code book that describes the variables, the data, and any transformations or work that you performed to clean up the data
* Step 1: "Merges the training and the test sets to create one data set."
* Step 2: "Extracts only the measurements on the mean and standard deviation for each measurement."
* Step 3: "Uses descriptive activity names to name the activities in the data set."
* Step 4: "Appropriately labels the data set with descriptive activity names." 
* Step 5: "Creates a second, independent tidy data set with the average of each variable for each activity and each subject."

Variable list and descriptions
------------------------------

Variable name    | Description
-----------------|------------
subject          | ID the subject who performed the activity for each window sample. Its range is from 1 to 30.
activity         | Activity name
featDomain       | Feature: Time domain signal or frequency domain signal (Time or Freq)
featInstrument   | Feature: Measuring instrument (Accelerometer or Gyroscope)
featAcceleration | Feature: Acceleration signal (Body or Gravity)
featVariable     | Feature: Variable (Mean or SD)
featJerk         | Feature: Jerk signal
featMagnitude    | Feature: Magnitude of the signals calculated using the Euclidean norm
featAxis         | Feature: 3-axial signals in the X, Y and Z directions (X, Y, or Z)
featCount        | Feature: Count of data points used to compute `average`
featAverage      | Feature: Average of each variable for each activity and each subject